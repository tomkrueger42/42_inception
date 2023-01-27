FROM alpine:3.16.3

RUN apk update && apk upgrade

RUN apk add --no-cache nginx openssl

ARG SSLDIR=/etc/nginx/ssl
ARG DOMAIN=tkruger.42.fr

RUN \
    # prepping openssl
    mkdir -p $SSLDIR && \
    chmod 700 $SSLDIR && \
    # creating new private key and certificate
    # # information for the temporary CSR that is being created
    openssl req -newkey rsa:4096 \
			-x509 \
			-sha256 \
			-days 365 \
			-nodes \
			-out self-signed.crt \
			-keyout self-signed.key \
			-subj "/C=DE/ST=BW/L=Heilbronn/O=42Heilbronn/OU=Core/CN=10.11.249.212"

COPY conf/nginx.conf /etc/nginx/conf.d/
# maybe even to /etc/nginx/sites-enabled/ ??

CMD ["nginx", "-g", "daemon off;"]
