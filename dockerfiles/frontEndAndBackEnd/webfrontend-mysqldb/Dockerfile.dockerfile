FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.47/bin/apache-tomcat-8.5.47.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.47/* /usr/local/tomcat/
COPY target/HelloWorld.war /usr/local/tomcat/webapps/
COPY lib/mysql-connector-java-5.1.48.jar /usr/local/tomcat/lib/
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
