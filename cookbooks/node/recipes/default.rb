package "nodejs" do
  version "0.8.26-1chl1~precise1"
  action :install
end

package "npm"

bash "configure node" do
user "ubuntu"
code <<-EOH
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
source /home/ubuntu/.bash_profile
nvm install v0.8.9
nvm use 0.8.9
EOH
end
