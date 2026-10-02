# Backup Strategy

## What Gets Backed Up
| Item | Location on server | Backed up? | Frequency |
|---|---|---|---|
| Docker Volumes and Images | /var/lib/docker | Yes | Weekly |
| AMP Server Instances |  /home/amp/.ampdata/instances | Yes | Weekly |

## Where Backups Go
- **Primary backup destination:** Backup folder on 4TB HDD on main PC
- **Secondary/offsite backup:** WD Mypassport Ultra 
- **Encryption:** N/A


## Retention Policy
- Every other week on main pc, monthly on WD
- Manual wiping

## Restore Procedure

1. Reinstall Debian
2. bash <(curl -fsSL getamp.sh) (installs AMP)
3. Create Compose File and give U + X permissions
4. Paste from Notepad and sudo ./(file name)
5. Tailscale (relies on DNS from PiHole)

## Last Tested Restore
- **Date:**
- **Result:**
- **Notes:**


