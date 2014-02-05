bash "Do CartoDBSQL stuff" do
code <<-EOH
git clone git://github.com/CartoDB/Windshaft-cartodb.git /home/ubuntu/Windshaft-cartodb
cd /home/ubuntu/Windshaft-cartodb
git checkout master
npm install
EOH
end

