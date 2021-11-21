FROM bitnami/minideb:latest

# Preparing the folders and installing packages.
RUN mkdir /gitbucket /java && apt-get update && apt-get -y install bash wget

# Uncomment if you are using a plugin that requires Git to be installed.
# RUN apt-get -y install git

# Downloading and extracting Temurin 17.0.1+12 from Adoptium.
RUN wget -q -O /java/openjdk.tar.gz "https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.1%2B12/OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.1_12.tar.gz"
RUN tar -xf /java/openjdk.tar.gz -C /java && mv /java/jdk-17.0.1+12 /java/jdk && rm -f /java/openjdk.tar.gz

# Setting up Java's environment variables
ENV JAVA_HOME /java/jdk
ENV PATH $PATH:/java/jdk/bin

# Downloading gitBucket 4.36.2
RUN wget -q -O /gitbucket/gitbucket.war "https://github.com/gitbucket/gitbucket/releases/download/4.36.2/gitbucket.war" 

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
