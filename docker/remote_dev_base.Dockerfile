FROM ubuntu:18.04

# Install vase dependencies
RUN apt-get update && apt-get install -y g++ ssh rsync gdb build-essential libssl-dev

# Configure ssh for remote development
# login: user
# password: password
# sshd port: 58291
RUN ( echo 'LogLevel DEBUG2'; \
      echo 'PermitRootLogin yes'; \
      echo 'PasswordAuthentication yes'; \
      echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
      echo 'Port 58291'; ) > /etc/ssh/sshd_config_test_clion \
    && mkdir /run/sshd \
    && useradd -m user \
    && yes password | passwd user

# Run ssh daemon with custom config
CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config_test_clion"]