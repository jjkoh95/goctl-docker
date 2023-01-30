FROM alpine:3

WORKDIR /app

RUN apk update
RUN apk add curl

# Refer: https://stackoverflow.com/questions/34729748/installed-go-binary-not-found-in-path-on-alpine-linux-docker
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2


# We don't actually have to care about OS
# ARG TARGETOS
ARG TARGETARCH

ARG GOCTL_VERSION

# Get goctl binaries from github
RUN curl -L -o goctl.tar.gz \
    "https://github.com/zeromicro/go-zero/releases/download/tools/goctl/${GOCTL_VERSION}/goctl-${GOCTL_VERSION}-linux-${TARGETARCH}.tar.gz"

RUN tar xzf goctl.tar.gz

# Set entrypoint
ENTRYPOINT [ "./goctl" ]
