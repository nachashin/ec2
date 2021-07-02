#!/bin/bash

# adding packages
amazon-linux-extras install -y epel
yum -y groupinstall Base "Development Tools"
yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional
yum -y git install lynx certbot

# configuring localtime
ln -sf /usr/share/zoneinfo/Japan /etc/localtime

# configuring hardware clock
sed -i "s/\"UTC\"/\"Japan\"/g" /etc/sysconfig/clock

# configuring character code
sed -i "s/en_US\.UTF-8/ja_JP\.UTF-8/g" /etc/sysconfig/i18n
echo "locale: ja_JP.UTF-8" >> /etc/cloud/cloud.cfg

# configuring .*rc files etc
