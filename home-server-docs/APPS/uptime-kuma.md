# Uptime Kuma

## Overview
- **Purpose:** Self-hosted service monitoring with status checks and alert notifications sent to Discord
- **Version:** ______ (shown in the web UI footer)
- **Docker image:** `louislam/uptime-kuma:2 
- **Official docs:** https://github.com/louislam/uptime-kuma/wiki

## Installation
Steps or command used to install:

```bash
docker run -d \
  --name uptime-kuma \
  --restart=always \
  -p 3001:3001 \
  -v uptime-kuma:/app/data \
  louislam/uptime-kuma:2
```

## Configuration
- **Config file location:** None. Settings and monitors are stored in the app database inside the data volume and managed in the web UI.
- **Key settings:**
  - Notification: Discord webhook, set under Settings → Notifications
  - Monitors:Pi-hole, Portainer, AMP panel, game server ports, internet connectivity
  - Check interval / retries: 120 seconds
- **Environment variables:** None

## Access
- **URL:** `http://192.168.1.194:3001`
- **Default username:** You create the admin account on first visit. Never store passwords here; use a password manager.
- **SSL/TLS:** No (internal only, not exposed to the internet). Reach it remotely over Tailscale.

## Data & Backup
- **Data location:** Docker volume `uptime-kuma` (mounted at `/app/data` in the container)
- **Included in backup routine?** Yes, via the weekly Docker volumes backup
- **Backup notes:** The database is SQLite, so stop the container before copying the volume for a consistent backup. Losing it means recreating all monitors and the Discord notification.

## Dependencies
- **Requires:** Docker, internet access to reach Discord, and a Discord webhook for the alert channel
- **Ports used:** 3001 (web UI)
- **Port conflicts to watch for:** 3001 is a common dev port (Grafana alternatives, Node apps). Check with `sudo ss -tulpn | grep 3001`.

## Networking
- **Exposed ports:** 3001, LAN only
- **Behind reverse proxy?** No
- **Subdomain/URL routing:** N/A

## Troubleshooting
Common issues for this app. See [TROUBLESHOOTING.md](https://github.com/ScottieFreshh/Home-Server/blob/main/home-server-docs/TROUBLESHOOTING.md) for the full log.

* **No Discord alerts:** Use the "Test" button on the notification. If it fails, check that the webhook is still valid (webhooks can be deleted from the Discord channel settings) and that the server can reach the internet and resolve DNS.
* **Monitors show down but the service works:** Check the target address and port from inside the container, and note that `localhost` inside Docker refers to the container itself. Use the host's LAN IP instead.
* **Web UI won't load:** Check `docker ps` and `docker logs uptime-kuma`.

## Update Procedure
```bash
docker stop uptime-kuma && docker rm uptime-kuma
docker pull louislam/uptime-kuma:______
# re-run the same docker run command from Installation
```
The `uptime-kuma` volume keeps monitors and settings. Back up the volume first, and check the release notes before major version jumps (a major version change can migrate the database).

## Notes
* The Discord webhook URL is a secret. Anyone with it can post to your channel, so keep it out of this repo and your compose files in version control.
* Uptime Kuma runs on the same server it monitors, so it can't alert you if the whole server or its internet connection goes down. Consider a free external monitor or a second check from another device as a backstop.
* Alerts are only useful if Discord notifications are enabled on your phone for that channel.
