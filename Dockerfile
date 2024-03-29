FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /myapp/backend
WORKDIR /myapp/backend
COPY Gemfile /myapp/backend/Gemfile
COPY Gemfile.lock /myapp/backend/Gemfile.lock
RUN bundle install
COPY . /myapp/backend


RUN chmod +x /myapp/backend/entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
