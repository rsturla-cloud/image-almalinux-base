ARG OS_VERSION=9
FROM quay.io/almalinuxorg/almalinux-bootc:${OS_VERSION}
ARG OS_VERSION

COPY files/ /
COPY scripts /tmp/scripts

RUN chmod +x /tmp/scripts/*.sh /tmp/scripts/build/*.sh && \
    /tmp/scripts/setup.sh && \
    /tmp/scripts/build.sh && \
    /tmp/scripts/cleanup.sh && \
    rm -rf /tmp/* && \
    bootc container lint

# Some files have been altered by the oscap remediation, so we need to
# overwrite them.  Once we are able to skip specific rules, we can remove this
# step.
COPY files/ /

CMD /sbin/init
