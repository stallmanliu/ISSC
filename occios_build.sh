#!/bin/bash

#occios_build.sh 

#set -x

#required executed as root 
USER=`whoami`
if [ "root" != "$USER" ]
then
  printf "pls execute as root! \n"
  exit
fi

###########################
#update system firstly
###########################
#apt-get update
#apt-get -y upgrade
if [ ! -f /etc/localtime_org ]
then
  printf "\n
  ###########################
  update system          
  ###########################
  \n"
  apt-get update
  apt-get -y upgrade
fi


###########################
#test expect
###########################
#expect <<EOF
#exit
#expect eof
#EOF
expect -v
if [ 0 -ne $? ]
then
  printf "\nGoing to install expect firstly !\n"
  printf "\napt-get -y install expect\n"
  apt-get -y install expect
fi

###########################
#prepare system
###########################
if [ ! -f /etc/default/locale_org ]
then
  cp /etc/default/locale /etc/default/locale_org
  printf "LANGUAGE=\"en_US.UTF-8\"
LC_ALL=\"en_US.UTF-8\"
LANG=\"en_US.UTF-8\"" > /etc/default/locale
fi

if [ ! -f /etc/localtime_org ]
then
  cp /etc/localtime /etc/localtime_org
  cp /usr/share/zoneinfo/America/Toronto /etc/localtime
  ntpdate cn.pool.ntp.org
  printf "\nGoing to reboot and continue after reboot !\n"
  reboot
  exit
fi


#################################
#optional install openssh-server
#################################
#apt-get install openssh-server

#####################################
#install openstack prerequires
#####################################

printf "\n
#####################################
install openstack prerequires 
#####################################
\n"

apt-get -y install python-pip python-dev build-essential git
pip install pyssf


##################################################################
#install openstack
##################################################################

printf "\n
###########################################
install openstack
###########################################
\n"

cd /opt
git clone git://github.com/openstack-dev/devstack.git
cd ./devstack
git checkout havana-eol
cd ..
./devstack/tools/create-stack-user.sh
cp ./devstack/samples/local.conf ./devstack/
cd ./devstack/

sed -i 's/ADMIN_PASSWORD=/#ADMIN_PASSWORD=/g' ./local.conf
sed -i 's/MYSQL_PASSWORD=/#MYSQL_PASSWORD=/g' ./local.conf
sed -i 's/RABBIT_PASSWORD=/#RABBIT_PASSWORD=/g' ./local.conf
sed -i 's/SERVICE_PASSWORD=/#SERVICE_PASSWORD=/g' ./local.conf
#sed -i 's/SERVICE_TOKEN=/#SERVICE_TOKEN=/g' ./local.conf

sed -i '/#ADMIN_PASSWORD=/a\ADMIN_PASSWORD=secrete' ./local.conf
sed -i '/#MYSQL_PASSWORD=/a\MYSQL_PASSWORD=$ADMIN_PASSWORD' ./local.conf
sed -i '/#RABBIT_PASSWORD=/a\RABBIT_PASSWORD=$ADMIN_PASSWORD' ./local.conf
sed -i '/#SERVICE_PASSWORD=/a\SERVICE_PASSWORD=$ADMIN_PASSWORD' ./local.conf
#sed -i '/#SERVICE_TOKEN=/a\SERVICE_TOKEN=a682f596-76f3-11e3-b3b2-e716f9080d50' ./local.conf

cd /opt
chown -R stack:stack ./devstack/
chmod -R 777 ./devstack/


su - stack <<EOF
cd /opt/devstack
./stack.sh
EOF


printf "\n
###########################################
End of occios_build.sh !
###########################################
\n"



exit







