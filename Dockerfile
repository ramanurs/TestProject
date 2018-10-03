FROM tomcat:8
COPY *.war /usr/local/tomcat/webapps/
RUN apt-get update && apt-get install -y vim
