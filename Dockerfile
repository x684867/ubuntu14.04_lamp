# Docker Container for Ubuntu 14.04 x64
# (c) 2014 EdgeCase, Inc.  sam@edgecase.io
# 
FROM x684867/ubuntucore14.04
MAINTAINER Sam Caldwell <mail@samcaldwell.net>
#
# LOCAL_MYSQL_SERVER determines if the mysql server 
#                    will be installed in the same 
#                    container.
#
ENV LOCAL_MYSQL_SERVER 1

ADD files/installLamp /usr/bin/installLamp
ADD files/installMySQLserver /usr/bin/installMySQLserver
ADD files/startLamp /usr/bin/

RUN /usr/bin/generateSelfSignedCert
RUN /usr/bin/installLamp
RUN [ "$LOCAL_MYSQL_SERVER" == "1" ] && /usr/bin/installMySQLserver 

EXPOSE 80

#default command when docker image is run
CMD ["/usr/bin/startLamp"]