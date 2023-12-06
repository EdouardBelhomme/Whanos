FROM jenkins/jenkins:lts

USER root

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

ENV CASC_JENKINS_CONFIG="/var/jenkins_home/my_jenkins.yml"

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
RUN apt-get update && apt-get install -y make g++

COPY my_jenkins.yml /var/jenkins_home/my_jenkins.yml

COPY job_dsl.groovy /var/jenkins_home/job_dsl.groovy
