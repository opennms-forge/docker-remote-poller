FROM opennms/openjdk:latest

LABEL maintainer "Ronny Trommer <ronny@opennms.org>"

ARG REMOTE_POLLER_VERSION=develop

ENV REMOTE_POLLER_URI http://localhost:8980/opennms-remoting
ENV REMOTE_POLLER_LOCATION Default
ENV REMOTE_POLLER_USERNAME admin
ENV REMOTE_POLLER_PASSWORD admin
ENV REMOTE_POLLER_JVM_ARGS -Xmx384m
ENV REMOTE_POLLER_RMI_PORT 1099

RUN yum -y --setopt=tsflags=nodocs update && \
    rpm -Uvh http://yum.opennms.org/repofiles/opennms-repo-${REMOTE_POLLER_VERSION}-rhel7.noarch.rpm && \
    rpm --import http://yum.opennms.org/OPENNMS-GPG-KEY && \
    yum -y install opennms-remote-poller jicmp jicmp6 && \
    yum clean all && \
    rm -rf /var/cache/yum

COPY ./docker-entrypoint.sh /

LABEL license="AGPLv3" \
      org.opennms.horizon.version="${REMOTE_POLLER_VERSION}" \
      vendor="OpenNMS Community" \
      name="Remote Poller"

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "-h" ]
