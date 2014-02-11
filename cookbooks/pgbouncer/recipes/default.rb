package "pgbouncer"

template "/etc/pgbouncer/pgbouncer.ini" do
owner "postgres"
group "postgres"
source "pgbouncer.ini.erb"
end

template "/etc/pgbouncer/userlist.txt" do
source "userlist.txt.erb"
owner "postgres"
group "postgres"
end

bash "Setup Folders" do
user "root"
code <<-EOH
chmod -R 755 /etc/pgbouncer/pgbouncer.ini
chmod -R 755 /etc/pgbouncer/userlist.txt
mkdir -p /var/log/pgbouncer
touch /var/log/pgbouncer/pgbouncer.log
chown -R postgres:postgres /var/log/pgbouncer
EOH
end
