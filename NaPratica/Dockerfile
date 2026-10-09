FROM alpine:latest

# Instala ferramentas de montagem, compiladores, depurador e essenciais
RUN apk update && apk add --no-cache \
    build-base \
    nasm \
    nano \
    gdb \
    make \
    gcc \
    binutils \
    bash

# Configura o diretório de trabalho dentro do container
WORKDIR /workspace

# Mantém o container ativo usando bash (já que instalamos o pacote bash)
CMD ["/bin/bash"]