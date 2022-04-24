FROM --platform=amd64 ruby:2.7.2

ENV LANG=C.UTF-8\
    TZ=Asia/Tokyo \
    APP=/app\
    BUNDLE_VERSION=2.2.11

RUN apt-get update && apt-get install -y netcat && apt-get install -y vim
RUN gem install bundler --version "$BUNDLE_VERSION" 

RUN mkdir ${APP}
WORKDIR ${APP}

COPY Gemfile* $APP/
RUN bundle install

COPY . $APP/

#CMD ["./bin/server-dev"]