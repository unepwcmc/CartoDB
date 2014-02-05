bash "Do CartoDBSQL stuff" do
code <<-EOH
git clone git://github.com/CartoDB/CartoDB-SQL-API.git /home/ubuntu/CartoDB-SQL-API
cd /home/ubuntu/CartoDB-SQL-API
git checkout master
npm install
EOH
end

