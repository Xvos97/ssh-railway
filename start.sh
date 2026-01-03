#!/bin/bash

mkdir -p /home/renderuser/.ssh
chmod 700 /home/renderuser/.ssh

# Jika pakai public key
if [ -f /authorized_keys ]; then
  cp /authorized_keys /home/renderuser/.ssh/authorized_keys
  chmod 600 /home/renderuser/.ssh/authorized_keys
  chown -R renderuser:renderuser /home/renderuser/.ssh
fi

/usr/sbin/sshd -D
