package "apache2-mpm-worker" 
package "apache2-threaded-dev"
package "libapr1-dev" 
package "libaprutil1-dev"

bash "Install Passenger Gem" do
code <<-EOH
rvm use 1.9.2@cartodb && gem install passenger
passenger-install-apache2-module --auto --languages ruby
sudo a2enmod ssl
sudo a2enmod rewrite
sudo mkdir /etc/apache2/ssl 
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt -subj "/C=DE/ST=Saxony/L=Dresden"
EOH
end




