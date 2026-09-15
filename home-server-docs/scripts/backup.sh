#!/bin/bash
#
# Backup script for home server
# Backs up app configs (not bulk media data) to a local target and,
# optionally, syncs to an offsite/cloud destination.
#
# Usage: ./backup.sh
# Schedule: Daily at 2 AM via cron
#   0 2 * * * /opt/docker/scripts/backup.sh >> /var/log/home-backup.log 2>&1

set -euo pipefail

SOURCE_DIRS=(
  "/opt/docker/pihole"
  "/opt/docker/plex/config"
)
BACKUP_DEST="/mnt/backup/home-server/$(date +%Y-%m-%d)"
RETENTION_DAYS=30

mkdir -p "$BACKUP_DEST"

for dir in "${SOURCE_DIRS[@]}"; do
  name=$(basename "$dir")
  echo "Backing up $name..."
  tar -czf "$BACKUP_DEST/${name}.tar.gz" -C "$(dirname "$dir")" "$name"
done

echo "Pruning backups older than $RETENTION_DAYS days..."
find /mnt/backup/home-server -maxdepth 1 -type d -mtime +"$RETENTION_DAYS" -exec rm -rf {} \;

echo "Backup complete: $BACKUP_DEST"

# Optional: sync to offsite/cloud storage, e.g.
# rclone sync /mnt/backup/home-server remote:home-server-backups
