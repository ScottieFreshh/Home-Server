# Backup Strategy

## What Gets Backed Up
| Item | Location on server | Backed up? | Frequency |
|---|---|---|---|
| App configs | /path/to/configs | Yes | Daily |
| App data (media, files) | /path/to/data | Yes/No | Weekly |
| Docker compose files | /path/to/compose | Yes | On change (git) |
| Full system image | — | Yes/No | Monthly |

## Where Backups Go
- **Primary backup destination:** (external drive, NAS, cloud)
- **Secondary/offsite backup:** (important for real disaster recovery — 3-2-1 rule: 3 copies, 2 media types, 1 offsite)
- **Encryption:** is the backup encrypted, and how?

## Backup Tools
- Tool(s) used: (restic, Borg, rsync, Duplicati, Proxmox Backup Server, etc.)
- Script location: [scripts/backup.sh](scripts/backup.sh)
- Schedule (cron/systemd timer):

## Retention Policy
- How many days/weeks/months of backups are kept
- How old backups get pruned

## Restore Procedure
Step-by-step for restoring from backup — this is the part people forget to document and regret it later.

1.
2.
3.

## Last Tested Restore
- **Date:**
- **Result:**
- **Notes:**

> A backup you haven't tested restoring is a hope, not a backup. Test this at least twice a year.
