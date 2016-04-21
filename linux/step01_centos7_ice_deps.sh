#!/bin/bash

ICEVER=${ICEVER:-ice35}

# Ice installation
if [ "$ICEVER" = "ice35" ]; then
	#start-recommended
	curl -o /etc/yum.repos.d/zeroc-ice-el7.repo \
	http://download.zeroc.com/Ice/3.5/el7/zeroc-ice-el7.repo

	yum -y install ice ice-python ice-servers
	#end-recommended
elif [ "$ICEVER" = "ice35-devel" ]; then
	curl -o /etc/yum.repos.d/zeroc-ice-el7.repo \
	http://download.zeroc.com/Ice/3.5/el7/zeroc-ice-el7.repo

	yum -y install ice ice-python-devel ice-java-devel ice-servers
elif [ "$ICEVER" = "ice36" ]; then
	#start-supported
	cd /etc/yum.repos.d
	wget https://zeroc.com/download/rpm/zeroc-ice-el7.repo

	yum -y install gcc-c++
	yum -y install libdb-utils
	yum -y install openssl-devel bzip2-devel expat-devel

	yum -y install ice-all-runtime ice-all-devel

	pip install zeroc-ice
	#end-supported
fi