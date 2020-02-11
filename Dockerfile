FROM 		aarif8/httpd-php

MAINTAINER 	aarif@ilg.cat

RUN		yum update -y
RUN		yum upgrade -y

RUN		yum install -y wget rsync vim
RUN		wget http://wordpress.org/latest.tar.gz
RUN		tar -xzvf latest.tar.gz
RUN		rsync -avP wordpress/ /var/www/html/
RUN		mkdir /var/www/html/wp-content/uploads
RUN		chown -R apache:apache /var/www/html/*

RUN		yum clean all && rm -rf /tmp/yum*

EXPOSE 80

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
