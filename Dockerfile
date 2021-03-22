FROM nginx:stable-alpine
RUN apk add openssl
COPY config.nginx /etc/nginx/nginx.conf
COPY allowed_server_name.conf /etc/nginx/allowed_server_name.conf
COPY startup.sh /startup.sh
CMD ["/bin/sh","/startup.sh"]
