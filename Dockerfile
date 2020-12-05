FROM debian:buster

#Install dependencies, add proxmox repo and install packages
RUN apt-get update && \
  apt-get install -y \
  wget \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/* && \
  echo "deb http://download.proxmox.com/debian/pbs buster pbs-no-subscription" > /etc/apt/sources.list.d/pbs-no-subscription.list && \
  wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg && \
  apt-get update && \
  apt-get install -y proxmox-backup-server=1.0.5-1

#Activate backup user
RUN chsh -s /bin/bash backup

#Start...
COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh
STOPSIGNAL SIGINT
CMD /entrypoint.sh
EXPOSE 8007/tcp

