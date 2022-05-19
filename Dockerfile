FROM tomcat
#RUN rm -fr /usr/local/tomcat/webapps/ROOT
COPY target/project1.war /usr/local/tomcat/webapps/
RUN sed -i 's/port="8080"/port="8081"/' ${CATALINA_HOME}/conf/server.xml
CMD ["catalina.sh", "run"]  
