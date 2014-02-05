package "python2.7-dev"
package "python-setuptools"

bash "Do Python Stuff" do
user "root"
code <<-EOH
easy_install pip
pip install --no-install GDAL
cd /tmp/pip_build_root/GDAL/
python setup.py build_ext --include-dirs=/usr/include/gdal
pip install --no-download GDAL
cd /home/ubuntu/cartodb
pip install --no-use-wheel -r python_requirements.txt
EOH
end
