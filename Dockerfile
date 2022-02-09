ARG REPO=mcr.microsoft.com/dotnet/aspnet
FROM $REPO:6.0.2-alpine3.14-amd64

RUN apk add --no-cache \
        curl \
        icu-libs \
        git

ENV PATH=${PATH}:/opt

WORKDIR /opt

# https://help.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions#user
USER root

# Install CodeWeTrust
RUN wget https://codewetrust-dist.s3-us-west-2.amazonaws.com/CodeWeTrustRunner_linux.tar.gz && tar -xzf CodeWeTrustRunner_linux.tar.gz

# Prepare entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

