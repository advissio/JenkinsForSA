FROM jenkins/jenkins:2.277.4
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
USER root
RUN apt-get install openssl ca-certificates \
     && rm /usr/share/ca-certificates/mozilla/DST_Root_CA_X3.crt \
     && update-ca-certificates
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY casc.yaml /var/jenkins_home/casc.yaml


