ARG SOURCE_TAG=10@sha256:63f8a6f26a30127353d3a8ed482c840bc28f5e9aa6943b7bc14b847518c9edc2
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
