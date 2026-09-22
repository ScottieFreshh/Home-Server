# Home Server Documentation

Central reference for my self-hosted infrastructure. Update this file every time something changes.

## Quick Links
- [Hardware](HARDWARE.md)
- [Network Setup](NETWORK.md)
- [Initial Setup / Rebuild Guide](SETUP.md)
- [Backup Strategy](BACKUP.md)
- [Troubleshooting](TROUBLESHOOTING.md)
- [Changelog](CHANGELOG.md)
- [Apps](APPS/)

## Services Running

| App | Purpose | URL | Doc |
|---|---|---|---|
| Example: Pi-hole | DNS / ad blocking | http://server-ip:80 | [pihole.md](APPS/example-pihole.md) |
| Example: Plex | Media server | http://server-ip:32400 | [plex.md](APPS/example-plex.md) |

> Delete the examples above and add your own apps here as you install them — one row per service, linking to its doc in `APPS/`.

## System Info
- **OS:**
- **Hostname:**
- **Static IP:**
- **Virtualization/Containers:** (Docker / Proxmox / bare metal)
- **Last full review:** YYYY-MM-DD

## Philosophy / Notes
- AT&T uses one device for modem and router
- Still have 6 keystones and roughly 20 RJ45 connectors left

Use this section for anything a future version of you needs to know before touching this server — design decisions, things you tried and abandoned, quirks of your ISP/router, etc.
