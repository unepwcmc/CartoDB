package "nodejs" do
  version "0.8.26-1chl1~precise1"
  action :install
end

package "npm"

bash "configure node" do
user "ubuntu"
group "ubuntu"
code <<-EOH
sudo -u ubuntu curl https://raw.github.com/creationix/nvm/master/install.sh | sh
sudo -u ubuntu source /home/ubuntu/.bash_profile
sudo -u ubuntu nvm install v0.8.9
sudo -u ubuntu nvm use 0.8.9
EOH
end
