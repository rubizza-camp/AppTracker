FROM ruby:2.6.2
COPY chain.pem /etc/letsencrypt/live/apptracker.club/chain.pem
COPY cert.pem /etc/letsencrypt/live/apptracker.club/cert.pem
COPY privkey.pem /etc/letsencrypt/live/apptracker.club/privkey.pem
COPY / /AppTracker
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /AppTracker
RUN gem install bundler
RUN bundle install

CMD ["export", "APPTRACKER_PG_DEV_DATABASE_NAME='test_data_base'"]
CMD ["export", "APPTRACKER_PG_DEV_USER_NAME='RemoteUser'"]
CMD ["export", "APPTRACKER_PG_DEV_USER_PASSWORD='asdi23ASLD1l2k3klalmibwpiebAWOMBeqmiwm12opBAMWOPienq2312'"]
CMD ["export", "APPTRACKER_PG_DEV_DATABASE_HOST='18.188.88.4'"]
CMD ["export", "APPTRACKER_PG_DEV_DATABASE_PORT='32769'"]

CMD ["rails", "server", "-b", "ssl://0.0.0.0:3000?key=/etc/letsencrypt/live/apptracker.club/privkey.pem&cert=/etc/letsencrypt/live/apptracker.club/cert.pem&ca=/etc/letsencrypt/live/apptracker.club/chain.pem"]