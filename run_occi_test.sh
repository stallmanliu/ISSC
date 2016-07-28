#!/bin/sh

ssh 192.168.0.20 <<EOF
service apache2 restart;
curl --insecure -u 'AKIAJFZHTZ44OBT26KSQ:mhwP6HbIW8EODHD+VUcS6859CShPWmsFK6KqRbVM' https://localhost:11443/-/
EOF

./ec2_basicauth_test.rb
