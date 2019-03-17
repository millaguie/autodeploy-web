FROM trafex/alpine-nginx-php7:latest

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD configure /usr/bin/configurebd

USER root
RUN chmod 755 /usr/bin/configurebd
RUN apk update && \
    apk add git && \
    git clone https://github.com/aalmanzaui1/ProyectoUI1.git && \
    mv ProyectoUI1/* . && \
    rm -rf ProyectoUI1 && \
    apk del git

RUN chown -R nobody:nobody /var/www/html
USER nobody
