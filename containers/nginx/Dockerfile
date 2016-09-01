FROM nginx
ADD nginx.conf /etc/nginx/sites-available/app.conf
RUN mkdir /etc/nginx/sites-enabled && \
    ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
