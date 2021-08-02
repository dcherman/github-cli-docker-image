FROM alpine as builder

RUN wget -O github-cli.tar.gz https://github.com/cli/cli/releases/download/v1.13.1/gh_1.13.1_linux_amd64.tar.gz && \
  tar xzvf github-cli.tar.gz -C /usr --strip-components=1

FROM gcr.io/distroless/static

COPY --from=builder /usr/bin/gh /bin/gh

ENTRYPOINT ["/bin/gh"]
