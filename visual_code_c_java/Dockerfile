FROM ghcr.io/coder/code-server:latest
# coder-server에는 기본 JDK17까지만 제공
USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      python3 python3-pip python3-venv \
      build-essential gcc g++ gdb cmake make git curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*
# JDK 21 추가
RUN curl -fsSL "https://api.adoptium.net/v3/binary/latest/21/ga/linux/x64/jdk/hotspot/normal/eclipse" -o /tmp/jdk21.tar.gz \
 && mkdir -p /opt/jdk-21 \
 && tar -xzf /tmp/jdk21.tar.gz -C /opt/jdk-21 --strip-components=1 \
 && rm -f /tmp/jdk21.tar.gz \
 && update-alternatives --install /usr/bin/java  java  /opt/jdk-21/bin/java  1 \
 && update-alternatives --install /usr/bin/javac javac /opt/jdk-21/bin/javac 1

ENV JAVA_HOME=/opt/java-21
ENV PATH=$JAVA_HOME/bin:$PATH

USER coder

# VS Code 확장 (cpptools는 Open VSX 이슈가 잦으니 clangd로 대체 권장)
RUN code-server --install-extension vscjava.vscode-java-pack \
 && code-server --install-extension ms-python.python \
 && code-server --install-extension ms-toolsai.jupyter \
 && code-server --install-extension llvm-vs-code-extensions.vscode-clangd \
 && code-server --install-extension MS-CEINTL.vscode-language-pack-ko \
 && code-server --install-extension webfreak.debug

WORKDIR /home/coder/project

