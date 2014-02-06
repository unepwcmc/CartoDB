remote_file "Download Postgis" do
path "/tmp/postgis-2.0.2.tar.gz"
source "http://download.osgeo.org/postgis/source/postgis-2.0.2.tar.gz"
end

bash "Install Postgis" do
user "root"
cwd "/tmp"
code <<-EOH
tar xzf postgis-2.0.2.tar.gz
cd /tmp/postgis-2.0.2
./configure --with-raster --with-topology
make
make install
EOH
end

bash "Post install changes" do
code <<-EOH
sudo -u postgres createdb -E UTF8 template_postgis
sudo -u postgres createlang -d template_postgis plpgsql
sudo -u postgres psql -d postgres -c "UPDATE pg_database SET datistemplate='true' WHERE datname='template_postgis'"
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.2/contrib/postgis-2.0/postgis.sql
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.2/contrib/postgis-2.0/spatial_ref_sys.sql
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.2/contrib/postgis-2.0/legacy.sql
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.2/contrib/postgis-2.0/rtpostgis.sql
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.2/contrib/postgis-2.0/topology.sql
sudo -u postgres psql -d template_postgis -c "GRANT ALL ON geometry_columns TO PUBLIC;"
sudo -u postgres psql -d template_postgis -c "GRANT ALL ON spatial_ref_sys TO PUBLIC;"
EOH
end



