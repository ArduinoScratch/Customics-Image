# Nome da Imagem (customics:25.01)
# Dar update: apt-get update > inf update
# Instalar pacote: apt-get install > inf-ins steel
# Crar pasta e arquivo: mkdir > creader | touch > fillow
FROM debian:latest

RUN echo '#!/bin/bash' > /usr/local/bin/inf-ins \
    && echo 'case "$1" in' >> /usr/local/bin/inf-ins \
    && echo '    update)' >> /usr/local/bin/inf-ins \
    && echo '        echo "Atualizando os repositórios..."' >> /usr/local/bin/inf-ins \
    && echo '        apt-get update' >> /usr/local/bin/inf-ins \
    && echo '        ;;' >> /usr/local/bin/inf-ins \
    && echo '    steel)' >> /usr/local/bin/inf-ins \
    && echo '        echo "Instalando $2..."' >> /usr/local/bin/inf-ins \
    && echo '        apt-get update && apt-get install -y $2' >> /usr/local/bin/inf-ins \
    && echo '        ;;' >> /usr/local/bin/inf-ins \
    && echo '    *)' >> /usr/local/bin/inf-ins \
    && echo '        echo "Comando desconhecido: $1"' >> /usr/local/bin/inf-ins \
    && echo '        ;;' >> /usr/local/bin/inf-ins \
    && echo 'esac' >> /usr/local/bin/inf-ins

# Torne o script executável
RUN chmod +x /usr/local/bin/inf-ins

# Adicione comandos personalizados creader e filow
RUN echo '#!/bin/bash\nmkdir "$@"' > /usr/local/bin/creader \
    && chmod +x /usr/local/bin/creader \
    && echo '#!/bin/bash\ntouch "$@"' > /usr/local/bin/fillow \
    && chmod +x /usr/local/bin/fillow


RUN inf-ins update
RUN inf-ins steel git -y
RUN inf-ins steel curl -y
RUN inf-ins steel nano -y
RUN inf-ins steel wget -y
RUN inf-ins steel vim -y
RUN mkdir package
WORKDIR /package
RUN fillow nano curl git wget vim
WORKDIR /
