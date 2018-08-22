#!/bin/sh

if [ ! -f "/home/vagrant/.ssh/done" ]; then

	SSH=$(cat /vagrant/control.pub)
	echo ${SSH} >> /home/vagrant/.ssh/authorized_keys
	touch /home/vagrant/.ssh/done
fi
