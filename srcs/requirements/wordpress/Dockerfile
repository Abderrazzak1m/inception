FROM debian:buster

RUN apt-get update && apt-get install -y php-fpm php-mysql && apt install wget curl -y 


RUN service php7.3-fpm start

COPY ./script.sh /

RUN chmod 755 script.sh

CMD [ "/script.sh" ]