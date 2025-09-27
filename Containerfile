ARG SOURCE_TAG=10@sha256:f54939966d7d034fcf6b4c942241fe8fd53c655892a6969a142ae5aa11ef493e
FROM quay.io/almalinuxorg/almalinux-bootc:${SOURCE_TAG}

COPY files/ /
COPY scripts /tmp/scripts

RUN chmod +x /tmp/scripts/*.sh /tmp/scripts/build/*.sh && \
    /tmp/scripts/setup.sh && \
    /tmp/scripts/build.sh && \
    /tmp/scripts/cleanup.sh && \
    rm -rf /tmp/* && \
    bootc container lint

CMD /sbin/init
