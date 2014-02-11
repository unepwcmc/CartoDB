package "apache2-mpm-worker" 
package "apache2-threaded-dev"
package "libapr1-dev" 
package "libaprutil1-dev"

bash "Install Passenger Gem" do
user "ubuntu"
group "ubuntu"
code <<-EOH
rvm use 1.9.2@cartodb && gem install passenger
passenger-install-apache2-module --auto --languages ruby
sudo a2enmod ssl
sudo a2enmod rewrite
sudo mkdir /etc/apache2/ssl 
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt -subj "/C=DE/ST=Saxony/L=Dresden"
echo "LoadModule passenger_module /home/ubuntu/.rvm/gems/ruby-1.9.2-p320@cartodb/gems/passenger-4.0.37/buildout/apache2/mod_passenger.so" | sudo tee -a /etc/apache2/apache2.conf
echo "<IfModule mod_passenger.c>" | sudo tee -a /etc/apache2/apache2.conf
echo "PassengerRoot /home/ubuntu/.rvm/gems/ruby-1.9.2-p320@cartodb/gems/passenger-4.0.37" | sudo tee -a /etc/apache2/apache2.conf
echo "PassengerDefaultRuby /home/ubuntu/.rvm/gems/ruby-1.9.2-p320@cartodb/wrappers/ruby" | sudo tee -a /etc/apache2/apache2.conf
echo "PassengerSpawnMethod direct" | sudo tee -a /etc/apache2/apache2.conf
echo "</IfModule>" | sudo tee -a /etc/apache2/apache2.conf
EOH
end
