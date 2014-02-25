#!/bin/bash
cd /home/ubuntu/cartodb
git show|grep commit > /home/ubuntu/cartodb/installed_version
git ls-remote https://github.com/CartoDB/cartodb.git|grep refs/heads/master > /home/ubuntu/cartodb/remote_version
sed -i 's/^.\{7\}//g' /home/ubuntu/cartodb/installed_version
sed -i 's/.\{18\}$//' /home/ubuntu/cartodb/remote_version
if diff  /home/ubuntu/cartodb/installed_version /home/ubuntu/cartodb/remote_version  >/dev/null ; then
  echo "No new release for cartodb"| mail -s 'No Release Change' <Email Address>
else
  echo "New release of cartodb"| mail -s 'New Release Available' <Email Address>
