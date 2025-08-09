ARG SOURCE_TAG=10@sha256:bea75a4c2fa603c158c7200b59efc1f629079a13a46aaac4a386b7bd099f9766
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
