FROM alpine:3.16.3

RUN apk update && apk upgrade

RUN apk add --no-cache nginx

COPY conf/nginx_config.cnf ./my.cnf
COPY tools/entrypoint.sh ./

RUN chmod +x entrypoint.sh

ENTRYPOINT ["sh", "entrypoint.sh"]