ARG REPO=mcr.microsoft.com/dotnet/aspnet
FROM $REPO:6.0.2-alpine3.14-amd64

RUN apk add --no-cache \
        curl \
        icu-libs \
        git

# Install CodeWeTrust
RUN wget https://codewetrust-dist.s3-us-west-2.amazonaws.com/CodeWeTrustRunner_linux.tar.gz && tar -xzf CodeWeTrustRunner_linux.tar.gz
