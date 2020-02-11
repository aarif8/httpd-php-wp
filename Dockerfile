FROM 		aarif8/httpd-php

MAINTAINER 	aarif@ilg.cat


RUN		yum install -y wget vim

RUN		wget http://wordpress.org/latest.tar.gz
RUN 		tar -xzvf latest.tar.gz; mv wordpress/* /var/www/html/.
RUN		rm -rf wordpress

RUN		yum clean all && rm -rf /tmp/yum*
RUN		systemctl enable httpd

EXPOSE 80

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
