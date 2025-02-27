FROM ubuntu:latest

RUN apt update && apt upgrade -y && apt install -y \
  net-tools \
  iputils-ping \ 
  nano \
  curl \ 
  git \ 
  apache2 \
  gdb \
  nodejs \
  perl \
  php \
  python3 \
  ruby \
  vim  \
  && setcap cap_setuid+ep /usr/bin/netstat \
  && setcap cap_setuid+ep /usr/bin/ping \
  && setcap cap_setuid+ep /usr/bin/nano \
  && setcap cap_setuid+ep /usr/bin/curl \
  && setcap cap_setuid+ep /usr/bin/git \
  && setcap cap_setuid+ep /usr/bin/gdb \
  && setcap cap_setuid+ep /usr/bin/node \
  && setcap cap_setuid+ep /usr/bin/perl \
  && setcap cap_setuid+ep /usr/bin/python3.12 \ 
  && setcap cap_setuid+ep /usr/bin/php8.3 \
  && setcap cap_setuid+ep /usr/bin/ruby3.2 \
  && setcap cap_setuid+ep /usr/bin/vim.basic

COPY cmd.php /var/www/html/

EXPOSE 80

ENTRYPOINT service apache2 start && /bin/bash
