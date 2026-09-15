# Setup / Rebuild Guide

The goal of this file: if the server dies tomorrow, you should be able to follow this top to bottom and be back up and running without guessing.

## 1. OS Install
- ISO/image used:
- Install steps or unattended install file location:
- Post-install hardening steps (disable root SSH login, change default ports, etc.):

## 2. Base System Configuration
- [ ] Set static IP (see [NETWORK.md](NETWORK.md))
- [ ] Set hostname
- [ ] Set timezone
- [ ] Update packages
- [ ] Configure SSH (key-based auth, disable password login)
- [ ] Configure firewall (ufw/iptables/nftables rules)
- [ ] Install Docker / container runtime (if used)
- [ ] Mount data drives / configure fstab

## 3. Core Services Install Order
List the order you install things in, since some depend on others (e.g. reverse proxy before web apps, Pi-hole before other DNS-dependent services).

1. Reverse proxy (Traefik/nginx)
2. DNS (Pi-hole)
3. Everything else — see [APPS/](APPS/)

## 4. Restore From Backup
- Pointer to [BACKUP.md](BACKUP.md) for how to restore app data and configs once the base system is up.

## 5. Verification Checklist
- [ ] All services reachable at expected URLs
- [ ] SSL certs valid
- [ ] DNS resolving correctly
- [ ] Backups running on schedule
- [ ] Monitoring/alerts active
