FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
  libio-socket-ssl-perl  libdigest-hmac-perl  libterm-readkey-perl \
  libmime-lite-perl libfile-libmagic-perl libio-socket-inet6-perl && \
  rm -rf /var/lib/apt/lists

RUN apt-get update && apt-get install -y \
  build-essential && \
  cpan install Net::DNS && \
  apt-get purge -y --auto-remove build-essential && \
  rm -rf /var/lib/apt/lists

COPY smtp-cli /usr/bin
WORKDIR /app
ENTRYPOINT [ "/usr/bin/smtp-cli" ]
