FROM quay.io/wildfly/wildfly-runtime-jdk11
COPY --chown=jboss:root target/server $JBOSS_HOME
RUN $JBOSS_HOME/bin/add-user.sh admin changeit --silent
CMD ["/opt/server/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-c", "standalone.xml", "--debug", "*:8787"]
RUN chmod -R ug+rwX $JBOSS_HOME
