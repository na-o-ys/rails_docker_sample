FROM nginx
ADD nginx.conf /etc/nginx/sites-available/app.conf
RUN rm -f /etc/nginx/conf.d/* && \
    ln -s /etc/nginx/sites-available/app.conf /etc/nginx/conf.d/app.conf
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
