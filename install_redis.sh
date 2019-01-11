#!/bin/bash
# Installation as a Service on Amazon Linux 
# Install from epel-repository
  
    echo Install EPEL Repository as per Amazon Linux

# Install EPEL

    # yum install epel-release -y
    sudo amazon-linux-extras install epel
    sudo yum update -y

# Install Redis

    sudo yum install redis -y

# Enable autostart

    sudo systemctl start redis.service
    sudo systemctl enable redis

# Check Status

    sudo systemctl status redis.service

# Verify the Installation

    redis-cli ping

# Tunning 

    echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf
    echo 'sysctl -w net.core.somaxconn=65535' >> /etc/rc.local
    echo 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' >> /etc/rc.local
  
# Additional configuration

    tail -n 100 /etc/redis.conf | sed 's/^appendsonly*/appendsonly yes/g' > /etc/redis.conf
    tail -n 100 /etc/redis.conf | sed 's/^apeendfsync*/appendfsync everysec/g' > /etc/redis.conf
    systemctl restart redis

# Reboot server

    reboot

# Old version (if you want))
# Need to be download into destination folder
# tar xzf redis-3.2.5.tar.gz
# cd redis-3.2.5
# make
