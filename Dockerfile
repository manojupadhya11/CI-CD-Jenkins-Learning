FROM amazonlinux:latest
#we can choose any base image such as centos, linux, ubuntu etc.
# Install necessary packages
RUN yum update -y
RUN yum install -y git wget openssh-server
#shadow-utils will provide us the "chpasswd" command, which we will use to change root password
RUN yum install -y shadow-utils-2:4.9-12.amzn2023.0.2.x86_64
RUN yum install python3 -y
# Download and install Oracle JDK
RUN wget https://download.oracle.com/java/17/archive/jdk-17.0.8_linux-x64_bin.rpm
RUN yum install -y jdk-17.0.8_linux-x64_bin.rpm

#Updating /etc/ssh/sshd_config file
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
# Set root password
RUN echo 'root:redhat' | chpasswd

# Configure SSH
RUN ssh-keygen -A


# Define the default command to run when the container starts
CMD ["/usr/sbin/sshd", "-D"]
