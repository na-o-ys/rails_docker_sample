FROM ruby:2.3.1
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs && \
    apt-get install -y nginx

# Nginx
ADD nginx.conf /etc/nginx/sites-available/app.conf
RUN rm -f /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf

# Rails App
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app
RUN mkdir /app/tmp/sockets

# Start Server
# TODO: environment
CMD bundle exec puma -d && \
    /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
