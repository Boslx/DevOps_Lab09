FROM alpine:edge

ENV LANG="en_US.UTF-8" \
    LC_ALL="C.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    TERM="xterm"

RUN apk --no-cache --update-cache add \
      nginx \
	  supervisor \
      && \
    mkdir -p /data/logs/supervisor && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

ADD ./files /nginx

RUN chmod u+x  /nginx/start.sh && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

WORKDIR /nginx/nginx_config

EXPOSE 80

CMD ["/nginx/start.sh"]
