FROM alpine:3.16.3

RUN apk update && apk upgrade

RUN apk add --no-cache nginx openssl

ARG SSLDIR=/etc/nginx/ssl
ARG DOMAIN=tkruger.42.fr

RUN \
    # prepping openssl
    mkdir $SSLDIR && \
    chmod 700 $SSLDIR && \
    # creating new private key and certificate
    openssl req -newkey rsa:2048 -nodes -keyout $SSLDIR/key.pem -x509 -days 365 -out $SSLDIR/certificate.pem \
    # information for the temporary CSR that is being created
    -subj "/C=DE/ST=BW/L=Heilbronn/O=42Heilbronn gGmbH/OU=Core/CN=$DOMAIN"

COPY conf/nginx.cnf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
