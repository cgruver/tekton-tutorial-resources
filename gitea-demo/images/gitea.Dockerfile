FROM registry.access.redhat.com/ubi8/ubi-minimal:8.5

ARG GITEA_VER=1.16.2

COPY gitea/entrypoint.sh /entrypoint.sh

RUN microdnf --nodocs install sqlite bash openssl wget ca-certificates tar shadow-utils gettext git && \
    mkdir /usr/local/gitea && \
    mkdir /gitea && \
    useradd -u 65536 -g 0 -d /usr/local/gitea gitea && \
    chown -R gitea:0 /usr/local/gitea && \
    chown -R gitea:0 /gitea && \
    chown gitea:0 /entrypoint.sh && \
    wget -O /usr/local/bin/gitea https://dl.gitea.io/gitea/${GITEA_VER}/gitea-${GITEA_VER}-linux-amd64 && \
    chmod 750 /usr/local/bin/gitea && \
    chmod 750 /entrypoint.sh

ENV HOME=/usr/local/gitea
ENV GITEA_WORK_DIR=/usr/local/gitea
VOLUME /usr/local/gitea
EXPOSE 3000 2222
USER 65536

ENTRYPOINT ["/entrypoint.sh"]