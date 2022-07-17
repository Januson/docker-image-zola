FROM rust:alpine AS builder

WORKDIR /workdir

ARG ZOLA_VERSION="0.16.0"
ARG ARCHIVE_URL="https://github.com/getzola/zola/archive/refs/tags/v${ZOLA_VERSION}.tar.gz"

RUN test -n "${ZOLA_VERSION}" \
	&& apk update \
	&& apk add --no-cache ca-certificates curl openssl-dev lld g++ cargo musl-dev make tar \
	&& curl -L "${ARCHIVE_URL}" | tar xz --strip 1 \
	&& RUSTFLAGS="-C link-arg=-fuse-ld=lld" cargo build --release \
	&& strip target/release/zola

FROM scratch
COPY --from=builder /workdir/target/release/zola /usr/bin/zola
WORKDIR /workdir
USER 1000
ENTRYPOINT [ "/usr/bin/zola" ]
CMD ["--help"]
