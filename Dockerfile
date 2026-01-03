FROM ubuntu:22.04

RUN apt update && \
    apt install -y openssh-server && \
    mkdir /var/run/sshd

# Buat user & password
RUN useradd -m -s /bin/bash renderuser && \
    echo 'renderuser:renderpass123' | chpasswd

# Konfigurasi SSH (PASSWORD ONLY)
RUN sed -i 's/#Port 22/Port 10000/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#UsePAM yes/UsePAM yes/' /etc/ssh/sshd_config

EXPOSE 10000

CMD ["/start.sh"]
