FROM wildfly:latest
#FROM openshift/eap70-openshift:latest
#RUN $JBOSS_HOME/bin/add-user.sh admin admin --silent

USER root
#RUN cp files/*.war $JBOSS_HOME/standalone/deployments/ 
USER jboss
copy files/JSKLibertyTestProject.war $JBOSS_HOME/standalone/deployments/ 
COPY jboss-config/standalone.xml $JBOSS_HOME/standalone/configuration
COPY jboss-config/modules/ $JBOSS_HOME/modules/

#EXPOSE 8080 8080
#EXPOSE 9990 8080

CMD ["/opt/eap/bin/standalone.sh", "-c", "standalone.xml", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
