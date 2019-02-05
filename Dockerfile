FROM ruby:2.5.3

RUN apt-get update -qq && apt-get install -y build-essential nodejs

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile

RUN bundle install

COPY . /app
