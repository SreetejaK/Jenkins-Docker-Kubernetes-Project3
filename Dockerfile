FROM tomcat:8.0.20-jre8

RUN mkdir /usr/local/tomcat/webapps/myapp

COPY kubernetes/target/GKETest.war /usr/local/tomcat/webapps/GKETest.war
COPY kubernetes/target/kubernetes-1.0-Surender.war /usr/local/tomcat/webapps/kubernetes-1.0-Surender.war
