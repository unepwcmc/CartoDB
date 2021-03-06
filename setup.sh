#!/bin/bash
rm /home/ubuntu/cartodb/.rvmrc
cd /home/ubuntu/cartodb && bundle install
mv /home/ubuntu/cartodb/config/database.yml.sample /home/ubuntu/cartodb/config/database.yml
echo "Please enter your host: "
read input_host
echo "Please enter your domain (without the suffix): "
read input_domain
echo "Please enter your domain suffix: "
read input_suffix
sudo wget "https://raw.github.com/unepwcmc/CartoDB/master/templates/cartodb" -O /etc/apache2/sites-available/cartodb
wget "https://raw.github.com/unepwcmc/CartoDB/master/templates/cartodb-sql.production.js" -O /home/ubuntu/CartoDB-SQL-API/config/environments/production.js
wget "https://raw.github.com/unepwcmc/CartoDB/master/templates/windshaft-production.js" -O /home/ubuntu/Windshaft-cartodb/config/environments/production.js
wget "https://raw.github.com/unepwcmc/CartoDB/master/templates/Procfile" -O /home/ubuntu/cartodb/Procfile
wget "https://raw.github.com/unepwcmc/CartoDB/master/templates/app_config.yml" -O /home/ubuntu/cartodb/config/app_config.yml
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
sudo sed -i "s/8080/8181/g" /etc/varnish/default.vcl
cd /home/ubuntu/cartodb && RAILS_ENV=production bundle exec rake assets:precompile
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
cd /home/ubuntu/cartodb && sudo foreman export upstart /etc/init -u ubuntu
