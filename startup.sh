echo "generating self-signed certs"
openssl req -x509 -days 365 -newkey rsa:4096 -nodes -subj "/C=US/ST=DE/O=BioLib/CN=proxy" -keyout /etc/nginx/key.pem -out /etc/nginx/cert.pem
echo "adding docker dns..."
echo "resolver" $(awk '/^nameserver /{print $2}' /etc/resolv.conf) "ipv6=off valid=30;" > /etc/nginx/dns.conf
echo "starting reverse proxy..."
nginx -g "daemon off;"
