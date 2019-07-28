# Pull base image.
FROM ubuntu

# Install pre requeirements.
RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y nano \
  && apt-get install -y python \
  && apt-get install -y curl \
  && apt-get install -y net-tools
 
# Define working directory.
# WORKDIR /data

# Install JAVA 8
RUN apt-get install -y openjdk-8-jdk 
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Install MAVEN
RUN wget https://www-us.apache.org/dist/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz \
  && tar xvf apache-maven-3.6.1-bin.tar.gz -C /opt/

ENV MAVEN_HOME /opt/apache-maven-3.6.1/bin/

# Install Presto
RUN wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.221/presto-server-0.221.tar.gz \ 
 && tar -xvf presto-server-0.221.tar.gz -C /opt/


# WORKDIR /opt
# Install Presto command line interface
RUN wget https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/0.221/presto-cli-0.221-executable.jar \
  && mv presto-cli-0.221-executable.jar /opt/presto \
  && chmod +x opt/presto
  # && chmod +x presto
# Define default command.


WORKDIR /opt
COPY ./presto/presto_init.sh ./presto_init.sh

# CMD ["./presto-server-0.221/bin/launcher", "start"]
# ENTRYPOINT ["bash alma.sh"]
# RUN bash
# VOLUME [ "./presto/etc:/opt/presto-server-0.211/etc" ]
# CMD ["bash -c ./presto-server-0.221/bin/launcher run && sleep 5 && tail -F /dev/null"]
# CMD ["./presto"]
# CMD [ "bash" ]
# CMD ["/presto-server-0.221/bin/launcher run "]