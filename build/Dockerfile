# syntax=docker/dockerfile:1

FROM golang:1.21 AS builder

SHELL ["/bin/bash", "-c"]

WORKDIR /src

COPY . .

RUN go mod download

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -ldflags "${EXTRA_LDFLAGS} -X main.Version=${VERSION:-v0.0.0-dev.0} -X main.Build=${REVISION:-0}" -a -o server main.go

FROM gcr.io/distroless/base:nonroot

LABEL org.opencontainers.image.title "go-autoindex"
LABEL org.opencontainers.image.source "https://github.com/zoomoid/go-autoindex"
LABEL org.opencontainers.image.licenses "Apache-2.0"
LABEL org.opencontainers.image.version ${VERSION}
LABEL org.opencontainers.image.revision ${REVISION}

WORKDIR /

COPY --from=builder /src/server /server

COPY assets /assets

USER 65532:65532

ENTRYPOINT [ "/server", "--listen", "[::]:8080", "--root", "/var/www/" ]
