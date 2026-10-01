# Home Server Documentation

Central reference for my self-hosted infrastructure. Update this file every time something changes.

## Quick Links
- [Hardware](HARDWARE.md)
- [Network Setup](NETWORK.md)
- [Network Diagram](network-diagram.md)
- [Initial Setup / Rebuild Guide](SETUP.md)
- [Backup Strategy](BACKUP.md)
- [Troubleshooting](TROUBLESHOOTING.md)
- [Changelog](CHANGELOG.md)
- [Apps](APPS/)
- [Main Pc Build](PC_BUILD.md)

## Services Running

| App | Purpose | URL | Doc |
|---|---|---|---|
|Pi-hole | DNS / ad blocking | http://192.168.1.194/admin | [pihole.md](APPS/example-pihole.md) |
| Portainer | Container/Stack Management | https://192.168.1.194:9443 | [portainer.md](APPS/portainer.md) |
| AMP | Game Server Hosting | http://192.168.1.194:8080 | [amp.md](APPS/amp.md) |


## System Info
- **OS:** Debian (Trixie) 13.7
- **Hostname:** Debian
- **Static IP:** 192.168.1.194
- **Containers:** Docker w/ Portainer
- **Last full review:** 2026-09-30

## Philosophy / Notes
- AT&T uses one device for modem and router, reverse DNS could require knowing IP without hostname
- Still have 6 keystones and roughly 20 RJ45 connectors left

Use this section for anything a future version of you needs to know before touching this server — design decisions, things you tried and abandoned, quirks of your ISP/router, etc.
