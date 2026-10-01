# Pi-hole

## Overview
- **Purpose:** Network-wide DNS sinkhole / ad blocking
- **Version:** v4.3.1
- **Docker image:** thenetworkchuck/networkchuck_pihole:latest
- **Official docs:**https://github.com/theNetworkChuck/NetworkChuck/blob/master/pihole.sh

## Installation
```
#!/bin/bash

# https://github.com/pi-hole/docker-pi-hole/blob/master/README.md

docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \
    -p 80:80 \
    -p 443:443 \
    -p 8081:8080 \
    -e TZ="America/Chicago" \
    -v "$(pwd)/etc-pihole/:/etc/pihole/" \
    -v "$(pwd)/etc-dnsmasq.d/:/etc/dnsmasq.d/" \
    --dns=127.0.0.1 --dns=1.1.1.1 \
    --restart=unless-stopped \
    thenetworkchuck/networkchuck_pihole

printf 'Starting up pihole container '
for i in $(seq 1 20); do
    if [ "$(docker inspect -f "{{.State.Health.Status}}" pihole)" == "healthy" ] ; then
        printf ' OK'
        echo -e "\n$(docker logs pihole 2> /dev/null | grep 'password:') for your pi-hole: https://${IP}/admin/"
        exit 0
    else
        sleep 3
        printf '.'
    fi

    if [ $i -eq 20 ] ; then
        echo -e "\nTimed out waiting for Pi-hole start, consult check your container logs for more info (\`docker logs pihole\`)"
        exit 1
    fi
done;
© 2020 GitHub, Inc.
```

## Configuration
- **Config file location:** `/opt/docker/pihole/etc-pihole`
- **Key settings:** Upstream DNS set to 8.8.8.8 
- **Environment variables:** `TZ`, `WEBPASSWORD` 

## Access
- **URL:** http://192.168.1.194/admin
- **Default username:** N/A (password only)
- **SSL/TLS:** No (internal only, not exposed to internet)

## Data & Backup
- **Data location:** `/opt/docker/pihole/etc-pihole`, `/opt/docker/pihole/etc-dnsmasq.d`
- **Included in backup routine?** Yes, weekly
- **Backup notes:** `gravity.db` and `custom.list` are the critical files if restoring manually

## Dependencies
- **Requires:** Nothing (standalone)
- **Ports used:** 53 (DNS, TCP+UDP), 80 (admin UI)
- **Port conflicts to watch for:**

## Networking
- **Exposed ports:** 53, 80
- **Behind reverse proxy?** No
- **Subdomain/URL routing:** N/A

## Troubleshooting
- If DNS stops resolving network-wide, check container is running first (`docker ps`) before touching client devices

## Update Procedure
```bash
docker compose pull pihole
docker compose up -d pihole
```
Check release notes for gravity database schema changes before major version bumps.

## Notes
Chosen over router-level ad blocking because it also gives per-client query logs and works even when devices leave the LAN (via Tailscale).
