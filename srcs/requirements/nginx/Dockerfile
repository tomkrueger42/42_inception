FROM alpine:3.16.3

RUN apk update && apk upgrade

RUN apk add --no-cache nginx openssl

RUN mkdir /etc/nginx/ssl &&
    chmod 700 /etc/nginx/ssl &&
    openssl req -×509 - nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/example.key -out /etc/ng inx/ssl/example.crt
    
COPY conf/nginx.cnf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
