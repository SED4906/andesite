FROM scratch as ctx
COPY build_files /

FROM ghcr.io/sed4906/alpine-bootc:edge

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

RUN PATH=/usr/bin bootc container lint
