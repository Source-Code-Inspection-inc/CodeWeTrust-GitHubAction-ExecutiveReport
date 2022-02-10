FROM mcr.microsoft.com/dotnet/runtime:6.0

# Basics
RUN apt update && apt install apt-utils apt-transport-https dirmngr wget curl gnupg software-properties-common build-essential unzip -y --no-install-recommends

# Locale
RUN DEBIAN_FRONTEND=noninteractive apt install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

# Install Git
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

# Node (required by sonar scanner)
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash && apt install -y nodejs

# Sonar scanner
RUN wget -O /opt/sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.3.0.2102-linux.zip && \
    unzip /opt/sonar-scanner.zip -d /opt

ENV PATH="/opt/sonar-scanner-4.3.0.2102-linux/bin:${PATH}"

# Cloc
RUN wget -O /usr/bin/cloc https://github.com/AlDanial/cloc/releases/download/v1.90/cloc-1.90.pl && chmod +x /usr/bin/cloc

# Cppcheck
RUN apt install -y cppcheck

# Rust plugin
ARG RUST_CHANNEL=1.45.0
ARG CARGO_HOME=/opt/.cargo
ENV RUSTUP_HOME=/opt/.rustup
ENV PATH=${CARGO_HOME}/bin:${PATH}
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y --no-modify-path --default-toolchain ${RUST_CHANNEL}; rustup component add rustfmt clippy;

# CodeWeTrust
ENV PATH=${PATH}:/opt
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
ENV DOTNET_RUNNING_IN_CONTAINER=true
ENV CODE_WE_TRUST_MODE DOCKER_CONSOLE

WORKDIR /opt

# https://help.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions#user
USER root

# Install CodeWeTrust
RUN wget https://codewetrust-dist-staging.s3-us-west-2.amazonaws.com/CodeWeTrustRunner_linux.tar.gz && tar -xzf CodeWeTrustRunner_linux.tar.gz

# Prepare entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
