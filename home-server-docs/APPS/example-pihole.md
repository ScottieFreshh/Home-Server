# Pi-hole (Example)

## Overview
- **Purpose:** Network-wide DNS sinkhole / ad blocking
- **Version:** 2024.01.0
- **Docker image:** pihole/pihole:latest
- **Official docs:** https://docs.pi-hole.net/

## Installation
```bash
docker compose up -d pihole
```

## Configuration
- **Config file location:** `/opt/docker/pihole/etc-pihole`
- **Key settings:** Upstream DNS set to 1.1.1.1 and 9.9.9.9; conditional forwarding enabled for local hostnames
- **Environment variables:** `TZ`, `WEBPASSWORD` (set via secrets, not in compose file)

## Access
- **URL:** http://192.168.10.5/admin
- **Default username:** N/A (password only)
- **SSL/TLS:** No (internal only, not exposed to internet)

## Data & Backup
- **Data location:** `/opt/docker/pihole/etc-pihole`, `/opt/docker/pihole/etc-dnsmasq.d`
- **Included in backup routine?** Yes, daily
- **Backup notes:** `gravity.db` and `custom.list` are the critical files if restoring manually

## Dependencies
- **Requires:** Nothing (standalone)
- **Ports used:** 53 (DNS, TCP+UDP), 80 (admin UI)
- **Port conflicts to watch for:** systemd-resolved on the host also wants port 53 — disabled it before installing

## Networking
- **Exposed ports:** 53, 80
- **Behind reverse proxy?** No
- **Subdomain/URL routing:** N/A

## Troubleshooting
- If DNS stops resolving network-wide, check container is running first (`docker ps`) before touching client devices
- See [TROUBLESHOOTING.md](../TROUBLESHOOTING.md) for the disk-space incident from Jan 2024

## Update Procedure
```bash
docker compose pull pihole
docker compose up -d pihole
```
Check release notes for gravity database schema changes before major version bumps.

## Notes
Chosen over router-level ad blocking because it also gives per-client query logs and works even when devices leave the LAN (via Tailscale).
