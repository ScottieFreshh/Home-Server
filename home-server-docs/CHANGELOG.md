# Changelog

All notable changes to the server setup. Newest entries at the top.

## 2026-10-01
- Added: Tailscale on the server for VPN remote access (no port forwarding)
- Changed: Pi-hole set as the global DNS nameserver for the tailnet, and configured to accept queries from the Tailscale interface
- Notes: Key expiry disabled for the server: Yes

## 2026-09-30
- Added: Pi-hole (Docker) for network-wide DNS / ad blocking
- Added: Portainer CE (Docker) for container and stack management
- Added: AMP (installed natively) for game server hosting

## 2026-09-24
- Changed: Reconfigured access point from range extender to access point, changed SSID to match router
    
## 2026-09-22
- Changed: Assembled rack and installed hardware

## 2026-9-21
- Notes: Cut wires to length and attached RE45 connectors for patch cables, then the same for main cables with keystones
- More Notes: Keystones are 10x less frustrating then RE45

---

### Example: 2024-01-15
- Added: Jellyfin as a Plex alternative
- Changed: Migrated Pi-hole config to Docker (was bare metal)
- Removed: Old Samba share, replaced with Nextcloud
- Notes: Had to update firewall rules to allow port 8096 for Jellyfin
