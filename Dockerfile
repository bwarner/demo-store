FROM ruby:2.7-alpine

RUN apk update && apk add build-base nodejs yarn postgresql-dev tzdata 

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN bundle install 
RUN yarn install

COPY . .

RUN bin/rails assets:precompile

LABEL maintainer="Byron Warner <bwarner@oncue.com>"

CMD rails server 
