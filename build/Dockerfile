# syntax=docker/dockerfile:1

FROM golang:1.21 AS builder

SHELL ["/bin/bash", "-c"]

WORKDIR /src

COPY . .

RUN go mod download

RUN CGO_ENABLED=0 go build -o server main.go

FROM gcr.io/distroless/base:nonroot

LABEL org.opencontainers.image.title "go-autoindex"
LABEL org.opencontainers.image.source "https://github.com/zoomoid/go-autoindex"

WORKDIR /

COPY --from=builder /src/server /server

COPY assets /assets

USER 65532:65532

ENTRYPOINT [ "/server", "--listen", "[::]:8080", "--root", "/var/www/" ]
