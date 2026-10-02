# Portainer CE

## Overview

* **Purpose:** Web UI for managing Docker (and Swarm/Kubernetes) containers, images, volumes, networks, and stacks
* **Version:** 2.39.1 LTS 
* **Docker image:** `portainer/portainer-ce:lts`
* **Official docs:** https://docs.portainer.io

## Installation

Steps or command used to install:

```bash
docker volume create portainer_data

docker run -d \
  --name portainer \
  --restart=always \
  -p 8000:8000 \
  -p 9443:9443 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:lts
```

## Configuration

* **Config file location:** None. Portainer has no config file, and settings are stored in its database at `/data` inside the container (the `portainer_data` volume).
* **Key settings:** Set in the UI under Settings
* **Environment variables:** None required. The mounted Docker socket is how it talks to the local Docker engine.

## Access

* **URL:** `https://192.168.1.194:9443`
* **Default username:** `admin` (you create it on first login, so there is no preset password).
* **SSL/TLS:** Yes, a self-signed certificate by default. Expect a browser warning until you replace it under Settings → SSL certificate or put it behind a reverse proxy.

## Data & Backup

* **Data location:** Docker volume
* **Included in backup routine?** Yes Weekly
* **Backup notes:** Portainer has a built-in backup under Settings → Backup Portainer, Stacks and containers you deployed through Portainer live in Docker itself, not in Portainer's backup.

## Dependencies

* **Requires:** A running Docker engine and access to `/var/run/docker.sock`. It needs no database and no reverse proxy.
* **Ports used:** 9443 (HTTPS UI), 8000 (Edge agent tunnel), and 9000 (HTTP UI, legacy and optional)
* **Port conflicts to watch for:** 9000 is commonly taken by other apps (Authentik, MinIO, PHP-FPM), and 8000 is a popular dev port. Drop `-p 8000:8000` if you don't use Edge agents.

## Networking

* **Exposed ports:** 9443 (and 8000 only if using Edge agents)
* **Behind reverse proxy?** No 

## Troubleshooting

Common issues for this app. See [TROUBLESHOOTING.md](https://github.com/ScottieFreshh/Home-Server/blob/main/home-server-docs/TROUBLESHOOTING.md) for the full log.

* **"Your Portainer instance timed out for security purposes":** You didn't create the admin user within about 5 minutes of first start. Run `docker restart portainer` and try again.
* **Certificate warning:** This is expected with the default self-signed cert.
* **Can't see local environment:** Check that the docker.sock mount is present and correct.
* **Port already in use:** Check with `sudo ss -tulpn | grep -E '8000|9443'`.

## Update Procedure

```bash
docker stop portainer && docker rm portainer
docker pull portainer/portainer-ce:lts
# re-run the same docker run command from Installation
```

The `portainer_data` volume keeps all your settings. Watch for:

* Check the release notes before major version jumps.
* Back up the volume first.
* Avoid `:latest` if you want predictable updates. `:lts` follows the long-term-support line.

## Notes

* Mounting `docker.sock` gives Portainer root-equivalent control of the host, so don't expose it directly to the internet.
