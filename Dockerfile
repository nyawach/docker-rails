FROM ruby:2.5.3

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
 && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

COPY . .
