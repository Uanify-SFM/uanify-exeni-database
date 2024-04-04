# Take ubuntu image to start configuring it
FROM ubuntu:22.04

# Update the package lists and install the newest versions of all packages currently installed
RUN apt-get update && apt-get upgrade -y

# Install Prerequisites
RUN apt-get install wget gpg apt-transport-https curl unzip -y

# Install AWS CLI 
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && \
    unzip awscliv2.zip && \
    ./aws/install

# Import the Eclipse Adoptium GPG key and add the repository to the apt sources list
RUN mkdir -p /etc/apt/keyrings && \
    wget -O- https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc && \
    echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list

# Import the Liquibase GPG key and add the Liquibase repository to the apt sources list
RUN wget -O- https://repo.liquibase.com/liquibase.asc | gpg --dearmor > liquibase-keyring.gpg && \
    cat liquibase-keyring.gpg | tee /usr/share/keyrings/liquibase-keyring.gpg > /dev/null && \
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/liquibase-keyring.gpg] https://repo.liquibase.com stable main' | tee /etc/apt/sources.list.d/liquibase.list

# Update the package lists
RUN apt-get update -y

# Install Java and Liquibase
RUN apt-get install temurin-17-jdk liquibase -y
