# Network Configuration

## IP Scheme
| Segment | Subnet | Purpose |
|---|---|---|
| Main LAN | 192.168.1.0/24 | Trusted devices |

## Server Network Details
- **Static IP:** 192.168.1.194
- **Gateway:** 192.168.1.254
- **DNS servers:** 8.8.8.8 + 192.168.1.194 (Pi-hole)
- **MAC address (if reserving via DHCP):** XX-XX-XX-XX-XX

## Port Forwarding / Reverse Proxy
| External Port | Internal Port | Service | Notes |
|---|---|---|---|
| | | | |

- **Tailscale:** No port forwarding is needed. Remote access goes through the Tailscale VPN (see VPN below).
- **Reverse proxy in use:** (nginx, Traefik, Caddy, none)
- **Reverse proxy config location:**
- **SSL/TLS certificate source:** (Let's Encrypt, self-signed, Cloudflare)
- **Cert renewal method:**

## Firewall Rules
N/A

## VPN
- **VPN service running:** Tailscale (installed on the server)
- **Purpose:** Remote access to the server and home services without port forwarding, plus Pi-hole DNS filtering for devices away from home
- **Config/key locations:** State in `/var/lib/tailscale`. Auth and settings are managed in the Tailscale admin console. No keys are stored in this repo.
- **DNS over VPN:** Pi-hole is set as the global nameserver in the Tailscale admin console (DNS tab) with "Override local DNS" on. Pi-hole accepts queries from the Tailscale interface.
- **Details:** [tailscale.md](APPS/tailscale.md)

