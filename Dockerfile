#Nome da Imagem (customics:25.01)
# Modo de instalar: apt-get > ins-add | install > steel
# Crar pasta e arquivo: mkdir > creader | touch > filow
FROM ubuntu:25.04 

RUN echo '#!/bin/bash' > /usr/local/bin/ins-add \
    && echo 'case "$1" in' >> /usr/local/bin/ins-add \
    && echo '    update)' >> /usr/local/bin/ins-add \
    && echo '        echo "Atualizando os repositórios..."' >> /usr/local/bin/ins-add \
    && echo '        apt-get update' >> /usr/local/bin/ins-add \
    && echo '        ;;' >> /usr/local/bin/ins-add \
    && echo '    steel)' >> /usr/local/bin/ins-add \
    && echo '        echo "Instalando $2..."' >> /usr/local/bin/ins-add \
    && echo '        apt-get update && apt-get install -y $2' >> /usr/local/bin/ins-add \
    && echo '        ;;' >> /usr/local/bin/ins-add \
    && echo '    *)' >> /usr/local/bin/ins-add \
    && echo '        echo "Comando desconhecido: $1"' >> /usr/local/bin/ins-add \
    && echo '        ;;' >> /usr/local/bin/ins-add \
    && echo 'esac' >> /usr/local/bin/ins-add

RUN chmod +x /usr/local/bin/ins-add
RUN echo '#!/bin/bash\nmkdir "$@"' > /usr/local/bin/creader \
    && chmod +x /usr/local/bin/creader \
    && echo '#!/bin/bash\ntouch "$@"' > /usr/local/bin/filow \
    && chmod +x /usr/local/bin/filow

RUN ins-add update -y
RUN ins-add steel git -y
RUN ins-add steel curl -y
RUN ins-add steel nano -y
RUN ins-add steel wget -y
COPY echo.sh /home/marcelo/Customics/
RUN chmod +x /home/marcelo/Customics/echo.sh
RUN creader Games
RUN creader formacaoaws
RUN creader AboutIt
RUN creader html
RUN creader Images
WORKDIR /formacaoaws
RUN git clone https://github.com/henrylle/bia.git
WORKDIR /Games
RUN mkdir Github
RUN mkdir PlayStore
WORKDIR /Games/PlayStore
RUN mkdir Creators
WORKDIR /Games/PlayStore/Creators
RUN mkdir Supercell

WORKDIR /Games/Github
RUN git clone https://github.com/robertkleffner/mariohtml5.git
RUN git clone https://github.com/dommmel/coffee-snake.git
RUN git clone https://github.com/cykod/AlienInvasion.git
WORKDIR /Games/PlayStore
WORKDIR /Games/PlayStore/Creators
WORKDIR /Games/PlayStore/Creators/Supercell
RUN /home/marcelo/Customics/echo.sh
WORKDIR /Images
RUN wget https://i.redd.it/cbr4zlbspcz41.png -O image1.png
WORKDIR /