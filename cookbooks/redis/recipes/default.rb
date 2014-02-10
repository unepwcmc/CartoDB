package "redis-server"

service "redis-server" do
  supports :restart => true, :start => true, :stop => true, :reload => true
  action :nothing
end 

template "/etc/redis/redis.conf" do
source "redis.conf.erb"
owner "root"
group "root"
mode "0755"
notifies :enable, "service[redis-server]"
notifies :start, "service[redis-server]"
end
