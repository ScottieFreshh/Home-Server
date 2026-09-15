# Plex (Example)

## Overview
- **Purpose:** Media server for movies/TV/music
- **Version:** 1.40.x
- **Docker image:** plexinc/pms-docker:latest
- **Official docs:** https://support.plex.tv/

## Installation
```bash
docker compose up -d plex
```

## Configuration
- **Config file location:** `/opt/docker/plex/config`
- **Key settings:** Hardware transcoding enabled (Intel Quick Sync passthrough), remote access enabled
- **Environment variables:** `PLEX_CLAIM` (single-use, obtained from plex.tv/claim at first setup only)

## Access
- **URL:** http://192.168.10.5:32400/web
- **Default username:** Plex account (linked, not local)
- **SSL/TLS:** Handled by Plex's own relay for remote access

## Data & Backup
- **Data location:** `/opt/docker/plex/config` (metadata/DB), media on separate array at `/mnt/media`
- **Included in backup routine?** Config: yes, daily. Media: no (too large — replaceable from source)
- **Backup notes:** The `Plug-in Support/Databases` folder is what actually matters for a fast recovery — don't need to back up thumbnails/cache

## Dependencies
- **Requires:** Access to `/dev/dri` for hardware transcoding
- **Ports used:** 32400 (main), several others for DLNA/discovery (disabled, not needed)
- **Port conflicts to watch for:** None currently

## Networking
- **Exposed ports:** 32400
- **Behind reverse proxy?** No — uses Plex's own relay for remote access
- **Subdomain/URL routing:** N/A

## Troubleshooting
- Transcoding failures usually mean the GPU device isn't passed through correctly — check `docker inspect` for device mappings
- See [TROUBLESHOOTING.md](../TROUBLESHOOTING.md)

## Update Procedure
```bash
docker compose pull plex
docker compose up -d plex
```

## Notes
Considered Jellyfin as a fully open-source alternative — kept both running for a while to compare hardware transcode support before deciding to stick with Plex for the family-friendly remote sharing features.
