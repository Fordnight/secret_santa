FROM ubuntu:16.04

# apt install system dependencies
RUN apt-get update && \
    apt-get install -y curl git imagemagick libcurl4-openssl-dev libmagickwand-dev python-software-properties software-properties-common tzdata vim

# apt install SQL dependencies
RUN apt-get update && \
    apt-get install -y libmysqlclient-dev libpq-dev mysql-client

# apt install PDF dependencies
RUN apt-get update && \
    apt-get install -y libjpeg-turbo8 libjpeg8-dev libpng12-dev libxrender-dev libfontconfig1-dev

# apt install node 10
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs

# apt install yarn
ENV yarn_version=1.17.3
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn

# apt install rvm
RUN apt-add-repository -y ppa:rael-gc/rvm && \
    apt-get update && \
    apt-get install -y rvm

# rvm install ruby
WORKDIR /www
COPY .rvmrc ./
ENV ruby_version=2.7.4
RUN bash -l -c "rvm install ruby-${ruby_version} --create && \
    rvm rvmrc warning ignore all.rvmrcs && \
    rvm rvmrc trust /www"

##RUN bundle update --bundler
#bundle install gems
 COPY Gemfile Gemfile.lock ./
ENV bundler_version=1.17.3
RUN bash -l -c "rvm use ruby-${ruby_version} && \
    gem install bundler:${bundler_version} && \
    bundle install"
