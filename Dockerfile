FROM busybox:latest

MAINTAINER Paul Novarese pvn@novarese.net
LABEL maintainer="pvn@novarese.net"
LABEL name="secret_test"
LABEL org.opencontainers.image.title="secret_test"
LABEL org.opencontainers.image.source="https://github.com/pvnovarese/secret_test"
LABEL org.opencontainers.image.description="simple test image to trigger anchore secret scan policies"

HEALTHCHECK none

RUN echo "aws_access_key_id=01234567890123456789" > /aws_key && \
    echo "aws_secret_access_key=0123456789012345678901234567890123456789" > /aws_secret_key && \
    echo "--BEGIN PRIVATE KEY--" > /private_key && \
    echo "auth: \\"something\\"" > /docker_auth && \
    echo "api-key=00000000000000000000000" > /api_key

USER nobody
ENTRYPOINT ["/bin/false"]
