FROM cloudbees/jnlp-slave-with-java-build-tools
USER root
RUN apt-get update && \
apt-get install -y openjdk-11-jdk
RUN wget https://services.gradle.org/distributions/gradle-6.4.1-bin.zip -P /tmp && \
unzip -d /opt/gradle /tmp/gradle-*.zip && \
export GRADLE_HOME=/opt/gradle/gradle-6.4.1 && \
export PATH=${GRADLE_HOME}/bin:${PATH}



