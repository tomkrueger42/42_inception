FROM alpine:3.16.3

RUN apk update && apk upgrade

RUN apk add --no-cache nginx

COPY tools/entrypoint.sh ./

RUN chmod +x entrypoint.sh

# ENTRYPOINT ["sh", "entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]