#!/bin/bash
rm /home/ubuntu/cartodb/.rvmrc
echo "1.9.2@cartodb" > /home/ubuntu/cartodb/.ruby-version
cd /home/ubuntu/cartodb
rvm use 1.9.2@cartodb --create && bundle install
cd /home/ubuntu/cartodb
RAILS_ENV=production bundle exec rake assets:precompile
echo "Please enter your host: "
read input_host
echo "Please enter your domain (without the suffix): "
read input_domain
echo "Please enter your domain suffix: "
read input_suffix
sudo sed -i "s/zzzz/${input_host}/g" /etc/apache2/sites-available/cartodb
sudo sed -i "s/xxxx/${input_domain}/g" /etc/apache2/sites-available/cartodb
sudo sed -i "s/yyyy/${input_suffix}/g" /etc/apache2/sites-available/cartodb
sed -i "s/zzzz/${input_host}/g" /home/ubuntu/cartodb/config/app_config.yml
sed -i "s/xxxx/${input_domain}/g" /home/ubuntu/cartodb/config/app_config.yml
sed -i "s/yyyy/${input_suffix}/g" /home/ubuntu/cartodb/config/app_config.yml
sed -i "s/zzzz/${input_host}/g" /home/ubuntu/Windshaft-cartodb/config/environments/production.js
sed -i "s/xxxx/${input_domain}/g" /home/ubuntu/Windshaft-cartodb/config/environments/production.js
sed -i "s/yyyy/${input_suffix}/g" /home/ubuntu/Windshaft-cartodb/config/environments/production.js
sed -i "s/zzzz/${input_host}/g" /home/ubuntu/CartoDB-SQL-API/config/environments/production.js
sed -i "s/xxxx/${input_domain}/g" /home/ubuntu/CartoDB-SQL-API/config/environments/production.js
sed -i "s/yyyy/${input_suffix}/g" /home/ubuntu/CartoDB-SQL-API/config/environments/production.js
sudo a2ensite cartodb
sudo service apache2 restart
cd /home/ubuntu/cartodb
echo "Please enter your password: "
read PASSWORD
echo "Please enter your admin password: "
read ADMIN_PASSWORD
echo "Please enter your email address: "
read EMAIL
cd /home/ubuntu/cartodb
RAILS_ENV=production bundle exec rake cartodb:db:setup SUBDOMAIN="${input_host}" PASSWORD="${PASSWORD}" ADMIN_PASSWORD="${ADMIN_PASSWORD}" EMAIL="${EMAIL}"
RAILS_ENV=production bundle exec rake cartodb:db:set_user_account_type["${input_host}",'[DEDICATED]']
RAILS_ENV=production bundle exec rake cartodb:db:set_unlimited_table_quota["${input_host}"]
RAILS_ENV=production bundle exec rake cartodb:db:set_user_private_tables_enabled["${input_host}",'true']
RAILS_ENV=production bundle exec rake cartodb:db:set_user_quota["${input_host}",10240]
sed -i "s/5432/6432/g" /home/ubuntu/cartodb/config/database.yml

