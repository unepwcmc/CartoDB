package "varnish" do
  version "2.1.0-2cdb~precise1"
  action :install
end

service "varnish" do
  service_name "postgresql"
  supports :restart => true, :status => true, :reload => true
end


template "/etc/default/varnish" do
source "varnish.erb"
notifies :restart, resources(:service => "postgresql"), :immediately
end
