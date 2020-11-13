FROM debian:buster

  
RUN apt-get update && \
  #Install dependencies
  apt-get install -y \
  wget \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/* && \
  
  #Add repository
  echo "deb http://download.proxmox.com/debian/pbs buster pbstest" > /etc/apt/sources.list.d/pbstest-beta.list && \
  wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg && \

  #Install packages
  apt-get update && \
  apt-get install -y proxmox-backup-server=0.9.6-1

#Activate backup user
RUN chsh -s /bin/bash backup

#Start...
COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh
STOPSIGNAL SIGINT
