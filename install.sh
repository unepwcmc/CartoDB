#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline-dev libyaml-dev git curl
# Install Ruby using RVM
sudo apt-get install ruby1.9.1 rubygems1.9.1 ruby1.9.1-dev
# Install Chef Gems
gem install bundler  --no-ri --no-rdoc
gem install chef --no-ri --no-rdoc 
gem install ruby-shadow --no-ri --no-rdoc
# Clone CartoDB repo
git clone --recursive https://github.com/CartoDB/cartodb.git /home/ubuntu/cartodb
# Add necessary Repos
sudo add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
sudo add-apt-repository -y ppa:chris-lea/node.js-legacy
sudo add-apt-repository -y ppa:cartodb/varnish
sudo add-apt-repository -y ppa:mapnik/nightly-2.1
# Add Postgres Repo
echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" | sudo tee /etc/apt/sources.list.d/pg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get -y update


