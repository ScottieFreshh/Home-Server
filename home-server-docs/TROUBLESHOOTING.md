# Troubleshooting Log

Keep this as a running log of real problems you hit and how you fixed them. Searchable gold for future-you.

## Template Entry
```
### [Short description of issue] — YYYY-MM-DD
**Symptom:**
**Affected service(s):**
**Cause:**
**Fix:**
**Prevention (if applicable):**
```

---

## Log

### Router and Access Point both using DHCP — 2026-09-24
- **Symptom:** Certain devices could only connect to an EXT network
- **Affected service(s):** IoT devices, phone
- **Cause:** Ap was set as an extender that would also configure DHCP, causing duplicate IP addresses
- **Fix:** Set device to access point mode, changed SSID to match router 
- **Prevention (if applicable):**
```

### Example: Pi-hole stopped resolving DNS — 2024-01-15
**Symptom:** All devices lost internet, browser showed DNS_PROBE_FINISHED_NXDOMAIN
**Affected service(s):** Pi-hole, all downstream devices
**Cause:** Pi-hole container ran out of disk space, gravity database corrupted
**Fix:** Cleared old logs, restored gravity.db from backup, restarted container
**Prevention:** Added log rotation and a disk space alert

---

## Common Commands Reference
Quick reference for commands you always forget:

```bash
# Check what's using a port
sudo lsof -i :PORT

# Docker: view logs for a service
docker logs -f CONTAINER_NAME

# Docker: restart a service
docker compose restart SERVICE_NAME

# Check disk space
df -h

# Check running services
docker ps
```
