# AMP (Application Management Panel)

## Overview

* **Purpose:** Web-based control panel for creating, running, and managing game servers (Minecraft, Valheim, Factorio, ARK, and many more) from one UI. A licence from CubeCoders is required.
* **Version:** Check the Web UI footer or run `ampinstmgr` on the host. AMP updates itself, so record the version you installed here: ______
* **Docker image:** None. AMP is installed natively on the host.
* **Official docs:** https://github.com/CubeCoders/AMP/wiki

## Installation

Steps or command used to install (native, official, on Debian/Ubuntu):

```bash
# Run as root or with sudo. The setup script installs dependencies, ampinstmgr,
# creates the "amp" system user, and creates the management instance (ADS01) on port 8080.
bash <(wget -qO- getamp.sh)
```

## Configuration

* **Config file location:** `/home/amp/.ampdata/instances/<InstanceName>/AMPConfig.conf` (for example `ADS01`). Stop the instance before editing by hand.
* **Key settings:** Most are changed in the Web UI under Configuration. From the CLI, use `ampinstmgr reconfigure <Instance> +Setting.Name value`. Notable ones:
  * `Core.Webserver.UsingReverseProxy` and `Core.Webserver.ReverseProxyHost` (needed behind a reverse proxy)
  * `Login.AuthServerURL` (set on every instance other than ADS01 if the ADS URL changes)
  * Under Configuration → New Instance Defaults, the default auth server URL
* **Environment variables:** None. Settings are managed in the Web UI or with `ampinstmgr reconfigure`.

## Access

* **URL:** `http://<server-ip>:8080` (ADS01, the management instance). Each game server instance also has its own web port.
* **Default username:** `admin` (you set the password in the first-run wizard). Never store passwords here; use a password manager.
* **SSL/TLS:** No by default. HTTPS is optional but strongly recommended, and is mandatory with AMP Enterprise. Options:
  * Let AMP set up nginx and certbot with `ampinstmgr setupnginx my.domain.com 8080`
  * Use a reverse proxy you already run
  * Use AMP's built-in HTTPS (requires a PFX certificate with a passphrase; `ampinstmgr convertcertificate` can convert a .cert and .key pair)

## Data & Backup

* **Data location:** `/home/amp/.ampdata/` (instances, game files, configs). Application files are in `/opt/cubecoders/amp/`.
* **Included in backup routine?** Yes / No (fill in)
* **Backup notes:** AMP has built-in per-instance backups (scheduled or manual) stored inside each instance's folder, so they live on the same disk as the data unless you copy them elsewhere. For real protection, back up `/home/amp/.ampdata/` off the host. Game worlds can be large, so consider excluding re-downloadable game binaries.

## Dependencies

* **Requires:** A CubeCoders AMP licence, a Linux host (Debian/Ubuntu is the best supported), and the `amp` system user. The setup script installs Java versions, 32-bit libraries, and other game dependencies as needed. No external database is required.
* **Ports used:**
  * 8080: ADS01 web UI / management
  * Additional web UI ports: one per game server instance, typically incrementing from 8081
  * Game ports: vary per game (for example Minecraft Java 25565/TCP, Minecraft Bedrock 19132/UDP)
* **Port conflicts to watch for:** 8080 is heavily used by other apps (Tomcat, many web UIs, proxies). If something else already holds it, change the ADS port or rebind with `ampinstmgr`. Two servers can't share a game port.

## Networking

* **Exposed ports:** 8080 (or your chosen ADS port) for the panel, plus whichever game ports you want players to reach. Forward only the game ports through your router, and keep the panel LAN or VPN only if possible.
* **Behind reverse proxy?** Yes / No (fill in)
* **Subdomain/URL routing:** e.g. `amp.yourdomain.com` → `http://localhost:8080`. Requirements:
  * Pass the `X-AMP-Scheme` header
  * Enable WebSocket support (needed for the live console)
  * Run the `ampinstmgr reconfigure` commands for the reverse proxy settings (see Configuration)
  * Port 80 must be reachable for certbot if you use AMP's nginx setup, and 443 for external HTTPS access

## Troubleshooting

Common issues for this app. See [TROUBLESHOOTING.md](https://github.com/ScottieFreshh/Home-Server/blob/main/home-server-docs/TROUBLESHOOTING.md) for the full log.

* **"Failed to enable unit: ampinstmgr.service does not exist":** The systemd unit didn't install cleanly. Stop all AMP processes, then run `apt purge ampinstmgr && apt install ampinstmgr`.
* **Web UI not loading:** Check whether another service owns the port with `sudo ss -tulpn | grep 8080`, and check the firewall (the setup script may add a ufw rule for 8080).
* **Game server not reachable by players:** Check that the game port is forwarded (TCP vs UDP matters) and open in the host firewall.
* **Instances can't log in after changing the ADS URL:** Update `Login.AuthServerURL` on each non-ADS01 instance.
* **Live view of an instance's output:** `ampinstmgr View <InstanceName>`

## Update Procedure

Update from the Web UI (the ADS instance and each game instance can be updated from their management pages), or on the command line run `sudo ampinstmgr upgradeall`. AMP is also installed from the CubeCoders apt repository, so `sudo apt update && sudo apt upgrade` updates `ampinstmgr`.

Watch for:

* Back up `/home/amp/.ampdata/` before major updates.
* Stop game servers (or schedule downtime) before updating, since updates restart instances.
* Game updates and AMP updates are separate, and a game update can break mods or plugins.

## Notes

* AMP is licensed software: a CubeCoders licence is required, and the licence is tied to the installation, so note which licence key and tier you are using (store the key in your password manager).
* ADS (the Application Deployment Service, `ADS01`) is the management instance that creates and controls all other instances. Keep it reachable and backed up.
* Running AMP in a VM or LXC with its own IP can keep game ports cleanly separated from the rest of your home server stack.
