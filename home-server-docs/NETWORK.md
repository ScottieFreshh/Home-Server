# Network Configuration

## IP Scheme
| Segment | Subnet | Purpose |
|---|---|---|
| Main LAN | 192.168.1.0/24 | Trusted devices |
| Server/Services | 192.168.10.0/24 | Home server + containers |
| IoT | 192.168.20.0/24 | Smart home devices |
| Guest | 192.168.30.0/24 | Guest WiFi |

> Replace with your actual VLANs/subnets. If you're not segmenting yet, just document the single subnet you're on.

## Server Network Details
- **Static IP:**
- **Gateway:**
- **DNS servers:**
- **MAC address (if reserving via DHCP):**

## Port Forwarding / Reverse Proxy
| External Port | Internal Port | Service | Notes |
|---|---|---|---|
| | | | |

- **Reverse proxy in use:** (nginx, Traefik, Caddy, none)
- **Reverse proxy config location:**
- **SSL/TLS certificate source:** (Let's Encrypt, self-signed, Cloudflare)
- **Cert renewal method:**

## DNS
- **Local DNS resolver:** (Pi-hole, router, none)
- **Domain used for services:** (e.g. `*.home.lan` or a real domain)
- **Dynamic DNS provider (if any):**

## Firewall Rules
Document any non-default rules — what's blocked, what's allowed between segments, and why.

## VPN
- **VPN service running:** (WireGuard, Tailscale, OpenVPN, none)
- **Purpose:** (remote access to home network, etc.)
- **Config/key locations:** (reference only — never store keys in this doc)

## Network Diagram
Link to or embed a diagram (draw.io, Excalidraw, etc.) showing how everything connects.
