FROM   debian:buster

RUN apt-get update && apt-get install -y nginx && apt-get install openssl -y
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=localhost"
COPY  ./nginx.conf /etc/nginx

CMD ["nginx", "-g", "daemon off;"]