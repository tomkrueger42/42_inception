FROM debian:buster

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y nginx && \
	apt-get install openssl

RUN openssl \
		req -x509 \
		-nodes \
		-days 365 \
		-newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt \
		-subj "/C=DE/ST=BW/L=HN/O=42 Heilbronn gGmbH/OU=Core/CN=tkruger.42.fr"

COPY conf/default.conf /etc/nginx/conf.d/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

# FROM alpine:3.16.3

# #RUN apk update && apk -upgrade

# RUN apk add --no-cache nginx openssl

# ARG SSLDIR=/etc/nginx/ssl
# ARG DOMAIN=tkruger.42.fr

# RUN \
#     # prepping openssl
#     mkdir -p $SSLDIR && \
#     chmod 700 $SSLDIR && \
#     # creating new private key and certificate
#     # # information for the temporary CSR that is being created
#     openssl req -newkey rsa:4096 \
#         -x509 \
#         -sha256 \
#         -days 365 \
#         -nodes \
#         -out self-signed.crt \
#         -keyout self-signed.key \
#         -subj "/C=DE/ST=BW/L=Heilbronn/O=42Heilbronn/OU=Core/CN=$DOMAIN"

# COPY conf/my_nginx.conf /etc/nginx/sites-enabled/
# # maybe even to /etc/nginx/sites-enabled/ ??

# CMD ["nginx", "-g", "daemon off;"]
