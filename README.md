This script should download and install CartoDB


Instructions:-


This has been tested on an EC2 medium instance running Ubuntu 12.04.


To begin with download and execute the install.sh file locally - This will install everything that is needed to run the chef script.

It will also clone the CartoDB repository.


Once you have done this do


git clone https://github.com/unepwcmc/CartoDB.git


Then run 

sudo chef-solo -c /home/ubuntu/chef/CartoDB/config/chefsolo.rb -j /home/ubuntu/chef/CartoDB/roles/cartodb.json



You will need to change the -c and -j paths above to where you cloned the repo.  You will also need to change the cookbooks path in the chefsolo.rb file to reflect the path.


Once the install has finished you will need to run the setup.sh file.

This will setup your cartodb environment.


Lastly you will need to add your domain to your DNS.


Things still needing to be added to the script:-

Remove both -s config options from /etc/default/varnish
