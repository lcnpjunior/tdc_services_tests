FROM ruby:2.3.5
ENV RAILS_ENV=test
RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient-dev && gem install bundler
ADD . /app
WORKDIR /app
RUN bundle install
