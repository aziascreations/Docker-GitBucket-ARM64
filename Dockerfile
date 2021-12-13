FROM eclipse-temurin:latest

# Preparing GitBucket's folder and installing packages.
RUN mkdir /gitbucket && apt-get update && apt-get -y install git

# Downloading GitBucket
ARG GITBUCKET_DESIRED_VERSION=4.37.0
ADD https://github.com/gitbucket/gitbucket/releases/download/$GITBUCKET_DESIRED_VERSION/gitbucket.war /gitbucket/gitbucket.war

# Setting up required GitBucket's environment variables
ENV GITBUCKET_HOME /gitbucket/gitbucket_data
ENV DATABASE_URL jdbc:h2:/gitbucket/gitbucket_data/data;MVCC=true
ENV JVM_RAM_MIN 128m
ENV JVM_RAM_MAX 256m

# Exposing HTTP, HTTPS and SSH ports
EXPOSE 8080
EXPOSE 8443
EXPOSE 29418

# Running the application
WORKDIR /gitbucket
CMD java -Xms$JVM_RAM_MIN -Xmx$JVM_RAM_MAX -Dlog4j2.formatMsgNoLookups=true -jar /gitbucket/gitbucket.war
