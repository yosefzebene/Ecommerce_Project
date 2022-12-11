FROM ruby:2.7.1

ENV RAILS_ROOT /project

RUN apt-get update && \
    apt-get install -y --no-install-recommends\
    libpq-dev \
    libvips42 && \
    mkdir -p ${RAILS_ROOT} && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log

WORKDIR ${RAILS_ROOT}

# ENV RAILS_ENV='development'
ENV RAILS_ENV='production'
ENV SECRET_KEY_BASE='0438994d9980448f4789d0450c0315d489e048b0a331a800ada71ab279f4585830436b14fa7ccb76865821b7f0efdde1071fa4ec1a0fd43e9d7854f3aa785a3b'

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

COPY . .

RUN bundle exec rails assets:precompile