# Home Server Documentation

Central reference for my self-hosted infrastructure. Update this file every time something changes.

## Quick Links
- [Hardware](home-server-docs/HARDWARE.md)
- [Network Setup](home-server-docs/NETWORK.md)
- [Network Diagram](home-server-docs/network-diagram.md)
- [Initial Setup / Rebuild Guide](home-server-docs/SETUP.md)
- [Backup Strategy](home-server-docs/BACKUP.md)
- [Troubleshooting](home-server-docs/TROUBLESHOOTING.md)
- [Changelog](home-server-docs/CHANGELOG.md)
- [Apps](home-server-docs/APPS/)
- [Main Pc Build](home-server-docs/PC_BUILD.md)

## Services Running

| App | Purpose | URL | Doc |
|---|---|---|---|
|Pi-hole | DNS / ad blocking | http://192.168.1.194/admin | [pihole.md](home-server-docs/APPS/pihole.md) |
| Portainer | Container/Stack Management | https://192.168.1.194:9443 | [portainer.md](home-server-docs/APPS/portainer.md) |
| AMP | Game Server Hosting | http://192.168.1.194:8080 | [amp.md](home-server-docs/APPS/amp.md) |
| Uptime Kuma | Service monitoring / Discord alerts | http://192.168.1.194:3001 | [uptime-kuma.md](home-server-docs/APPS/uptime-kuma.md) |
| Tailscale | VPN / remote access | Admin console: https://login.tailscale.com/admin | [tailscale.md](home-server-docs/APPS/tailscale.md) |


## System Info
- **OS:** Debian (Trixie) 13.7
- **Hostname:** Debian
- **Static IP:** 192.168.1.194
- **Containers:** Docker w/ Portainer
- **Remote access:** Tailscale (Pi-hole used as tailnet DNS)
- **Last full review:** 2026-10-01

## Philosophy / Notes
- AT&T uses one device for modem and router, reverse DNS could possibly make setup more challenging
- Still have 6 keystones and roughly 20 RJ45 connectors left

Use this section for anything a future version of you needs to know before touching this server — design decisions, things you tried and abandoned, quirks of your ISP/router, etc.
