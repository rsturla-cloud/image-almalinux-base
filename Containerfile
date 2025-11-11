ARG SOURCE_TAG=10@sha256:598d91567895ec4d28bc8b38b4e62c9b84b2c04cc2c4dcda5088a8c6840a83e2
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
