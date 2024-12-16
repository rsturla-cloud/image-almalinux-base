ARG OS_VERSION=9
FROM quay.io/almalinuxorg/almalinux-bootc:${OS_VERSION}
ARG OS_VERSION

COPY files/ /
COPY scripts /tmp/scripts

RUN chmod +x /tmp/scripts/*.sh /tmp/scripts/build/*.sh && \
    /tmp/scripts/setup.sh && \
    /tmp/scripts/build.sh && \
    /tmp/scripts/cleanup.sh && \
    rm -rf /tmp && \
    bootc container lint

CMD /sbin/init
