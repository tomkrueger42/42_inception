# NGINX Dockerfile

# using alpine:3.16.3 as it is the penultimate stable version available to avoid dependancy conflicts
FROM alpine:3.16.3

# updating the alpine package keeper (apk) indexes
# upgrading any preinstalled packages
# adding necessary packages
#	nginx as the webserver & reverse proxy
#	openssl for creating ssl certificate
RUN apk update \
	&& apk --no-cache upgrade \
	apk --no-cache add nginx openssl

# creating the ssl private key and certificate with openssl req
# openssl req:		certificate request and certificate generating utility
#	-x509:			outputs self-signed certificate instead of certificate request
#	-days [n]:		specifies the number of days to certify the self-signed certificate
#	-nodes:			the private key will not be encrypted
#	-newkey [arg]:	creates a new certificate request and a new private key with the algorithm and size specified in arg
#	-keyout:		filename to write the newly created private key to
#	-out:			specifies the output filename to write to
#	-subject:		prints out the certificate subject
RUN openssl req \
		-x509 \
		-days 365 \
		-nodes \
		-newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt \
		-subj "/C=DE/ST=BW/L=HN/O=42 Heilbronn gGmbH/OU=Core/CN=tkruger.42.fr"

# copies the nginx config file to http.d since only http.d is included inside an http config block
COPY conf/default.conf /etc/nginx/http.d/

# runs nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
