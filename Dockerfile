#FROM tomcat:9.0
#EXPOSE 8080
#CMD ["catalina.sh", "run"]


FROM ubuntu:20.04
RUN apt update
RUN apt install default-jdk -y
RUN apt install maven -y
#RUN apt install tomcat9 -y
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.34/bin/apache-tomcat-9.0.34.tar.gz
RUN tar -xzf apache-tomcat-9.0.34.tar.gz -C /opt/
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd /boxfuse-sample-java-war-hello/
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR /boxfuse-sample-java-war-hello/target
RUN cp hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
WORKDIR /opt/apache-tomcat-9.0.34/bin
CMD ["catalina.sh", "run"]