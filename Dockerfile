FROM debian:jessie

MAINTAINER mickael.canevet@camptocamp.com

EXPOSE 8080 8081

ENV RELEASE jessie

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8

ENV PUPPETDB_VERSION 4.2.2-1puppetlabs1

ENV PATH=/opt/puppetlabs/server/bin:/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH

RUN \
apt-get update && \
apt-get install -y curl locales-all && \
curl -O http://apt.puppetlabs.com/puppetlabs-release-pc1-${RELEASE}.deb && \
dpkg -i puppetlabs-release-pc1-${RELEASE}.deb && \
rm puppetlabs-release-pc1-${RELEASE}.deb && \
apt-get update && \
apt-get install -y puppetdb=$PUPPETDB_VERSION && \
rm -rf /var/lib/apt/lists/* && \
chmod +r /opt/puppetlabs/server/apps/puppetdb/*.jar

# RUNTIME
COPY /docker-entrypoint.sh /
COPY /docker-entrypoint.d/* /docker-entrypoint.d/
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "puppetdb", "foreground" ]
