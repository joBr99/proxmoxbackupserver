
# ProxmoxBackupDocker

Unofficial Docker container for running proxmox backup server in docker,
Ref:[https://pbs.proxmox.com/](https://pbs.proxmox.com/)


Current limitations:

 - Only storage that is mapped with dicrectory will work.
 - Some of the statistic graphs are not working
 - Maybe other limitations

```
# docker-compose.yml
version: '3'
services:
  proxmox-backup-server:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: proxmox-backup-server
    hostname: proxmox-backup-server
    ports:
      - 8007:8007
    volumes:
      - /etc/shadow:/etc/shadow:ro #Mounts your hosts password file as read-only, your host root password can be used to sign in
      - ./data/etc-proxmox-backup:/etc/proxmox-backup
      - ./data/var-lib-proxmox-backup:/var/lib/proxmox-backup
```
