#!/bin/bash
sudo apt-get install -y nginx
sudo service nginx stop
sudo cp /vagrant/conf/lb.conf /etc/nginx/sites-enabled/default
sudo service nginx start
