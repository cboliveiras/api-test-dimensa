FROM ruby:3.1.2
  RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
  WORKDIR /api-test-dimensa
  COPY Gemfile /api-test-dimensa/Gemfile
  COPY Gemfile.lock /api-test-dimensa/Gemfile.lock
  RUN bundle install
  COPY . /api-test-dimensa

  EXPOSE 3000
