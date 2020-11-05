FROM ruby:2.7.2-slim-buster

RUN apt-get update && apt-get -y install postgresql-client libpq-dev memcached imagemagick ffmpeg mupdf mupdf-tools libxml2-dev curl build-essential patch ruby-dev zlib1g-dev liblzma-dev nodejs gnupg2

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get -y install yarn

RUN mkdir -p /secret_santa
WORKDIR /secret_santa
COPY Gemfile /secret_santa/Gemfile
COPY Gemfile.lock /secret_santa/Gemfile.lock
RUN bundle install
COPY package.json yarn.lock ./
RUN yarn install --check-files
COPY . /secret_santa

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]