FROM eclipse-temurin:latest

# Preparing GitBucket's folder and installing packages.
RUN mkdir /gitbucket && apt-get update

# Comment if you don't need a shell access via bash in the container.
# RUN apt-get -y install bash

# Uncomment if you are using a plugin that requires Git to be installed.
# RUN apt-get -y install git

# Downloading gitBucket 4.36.2
ADD https://github.com/gitbucket/gitbucket/releases/download/4.36.2/gitbucket.war /gitbucket/gitbucket.war 

# Setting up required GitBucket's environment variables
ENV GITBUCKET_HOME /gitbucket/gitbucket_data
ENV DATABASE_URL jdbc:h2:/gitbucket/gitbucket_daya/data;MVCC=true

# Exposing HTTP and SSH ports
EXPOSE 8080
EXPOSE 8443

# Running the application
# You can remove the "-Xms128m" and "-Xmx256m" arguments if you need to support more than a couple concurent users.
WORKDIR /gitbucket
CMD ["java", "-Xms128m", "-Xmx256m", "-jar", "/gitbucket/gitbucket.war"]
