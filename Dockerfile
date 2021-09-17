FROM tomcat:8.0.20-jre8

RUN mkdir /usr/local/tomcat/webapps/myapp

COPY kubernetes/target/GKETest.war /usr/local/tomcat/webapps/GKETest.war
