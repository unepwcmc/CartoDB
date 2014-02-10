bash "Do CartoDBSQL stuff" do
user "ubuntu"
group "ubuntu"
code <<-EOH
git clone git://github.com/CartoDB/Windshaft-cartodb.git /home/ubuntu/Windshaft-cartodb
cd /home/ubuntu/Windshaft-cartodb
git checkout 1.6.3-3-gdb47857
npm install
EOH
end

