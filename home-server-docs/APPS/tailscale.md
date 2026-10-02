# Tailscale

## Overview
- **Purpose:** Mesh VPN for remote access to the server (and Pi-hole DNS) from outside the home network, with no port forwarding
- **Version:**  1.102.4 (run `tailscale version`)
- **Docker image:** None. Installed natively on the host.
- **Official docs:** https://tailscale.com/kb

## Installation
Steps or command used to install (official script, Debian):

```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
# Add any flags you used, e.g. --advertise-routes=192.168.1.0/24
```

## Configuration
- **Config file location:** None. State is stored in `/var/lib/tailscale`. Most settings live in the admin console.
- **Key settings:**
  - DNS: Pi-hole's Tailscale IP is set as a custom global nameserver in the admin console (DNS tab), with "Override local DNS" enabled so all tailnet devices use it
  - Key expiry disabled for this machine: yes 
  - Subnet router for 192.168.1.0/24: no 
  - Exit node: yes / no (fill in)
- **Environment variables:** None

## Access
- **URL:** Admin console at https://login.tailscale.com/admin
- **Login method:** (identity provider only, e.g. Google/GitHub). Never store passwords, auth keys, or recovery codes here.
- **SSL/TLS:** N/A. Traffic is encrypted with WireGuard.

## Data & Backup
- **Data location:** `/var/lib/tailscale`
- **Included in backup routine?** No
- **Backup notes:** After a rebuild, re-run `sudo tailscale up` and re-authenticate. The server registers as a new node, so delete the old one in the admin console and re-check the DNS and route settings.

## Dependencies
- **Requires:** Internet access, a Tailscale account, and Pi-hole running for tailnet DNS
- **Ports used:** Outbound only. No router port forwarding is needed. UDP 41641 helps establish direct connections but is optional.
- **Port conflicts to watch for:** None

## Networking
- **Exposed ports:** None
- **Behind reverse proxy?** No
- **DNS:** All tailnet devices resolve through Pi-hole (see [example-pihole.md](example-pihole.md)). Pi-hole must accept queries from the `tailscale0` interface.
- **IP forwarding:** Only needed if acting as a subnet router or exit node (check `/etc/sysctl.d/`)

## Troubleshooting
Common issues for this app. See [TROUBLESHOOTING.md](https://github.com/ScottieFreshh/Home-Server/blob/main/home-server-docs/TROUBLESHOOTING.md) for the full log.

* **Remote devices have no DNS or can't resolve anything:** Pi-hole is probably down or ignoring tailnet queries. Check `docker ps`, then in Pi-hole set Settings → DNS → Interface settings to permit queries from the Tailscale interface (or "Permit all origins" if Pi-hole runs in Docker).
* **Can't reach the server remotely:** Run `tailscale status` on both ends, then `tailscale ping <device>`.
* **Server dropped off the tailnet:** The node key may have expired. Re-authenticate with `sudo tailscale up`, or disable key expiry in the admin console.
* **LAN devices unreachable remotely:** Confirm the subnet route is advertised and approved in the admin console.

## Update Procedure
```bash
sudo apt update && sudo apt upgrade
```
Tailscale installs from its apt repo, so it updates with normal system packages. Check `tailscale status` afterward to confirm it reconnected.

## Notes
* Remote devices get Pi-hole ad blocking and per-client query logs while away from home.
* If Pi-hole goes down, all tailnet devices lose DNS. Consider a fallback nameserver if that becomes a problem.
* Keep tailnet names (`*.ts.net`), `100.x.y.z` addresses, and auth keys (`tskey-...`) out of this repo.
