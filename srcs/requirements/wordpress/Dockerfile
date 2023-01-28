FROM alpine:3.16.3

RUN apk update && apk --no-cache upgrade

RUN mkdir -p /usr/share/webapps && \
	cd /usr/share/webapps && \
	wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf /usr/share/webapps/ && \
	rm latest.tar.gz && \
	chown -R root:root wordpress && \
	mkdir /var/www/ && \
	ln -s wordpress/ /var/www/
