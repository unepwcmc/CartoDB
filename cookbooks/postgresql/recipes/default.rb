package "postgresql-9.2"
package "postgresql-client-9.2"
package "postgresql-contrib-9.2"
package "postgresql-server-dev-9.2"
package "postgresql-plpython-9.2"

service "postgresql" do
  service_name "postgresql"
  supports :restart => true, :status => true, :reload => true
end



template "/etc/postgresql/9.2/main/pg_hba.conf" do
source "pg_hba.conf.erb"
owner "postgres"
group "postgres"
notifies :restart, resources(:service => "postgresql"), :immediately
end


