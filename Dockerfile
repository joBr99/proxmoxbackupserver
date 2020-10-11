FROM debian:buster

#Install dependencies
RUN apt-get update
RUN apt-get install wget ca-certificates -y

#Add repository
RUN echo "deb http://download.proxmox.com/debian/pbs buster pbstest" > /etc/apt/sources.list.d/pbstest-beta.list
RUN wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg

#Install packages
RUN apt-get update
RUN apt-get install -y proxmox-backup-server=0.9.0-2

#Activate backup user
RUN chsh -s /bin/bash backup

#Start...
COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh
STOPSIGNAL SIGINT
