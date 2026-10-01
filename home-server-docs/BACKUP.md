# Backup Strategy

## What Gets Backed Up
| Item | Location on server | Backed up? | Frequency |
|---|---|---|---|
| Docker Volumes and Images | /var/lib/docker | Yes | Weekly |
| AMP Server Instances |  /home/amp/.ampdata/instances | Yes | Weekly |

## Where Backups Go
- **Primary backup destination:** 4TB HDD on main PC
- **Secondary/offsite backup:** WD Mypassport Ultra 
- **Encryption:** N/A


## Retention Policy
- Every other week on main pc, monthly on WD
- Manual wiping

## Restore Procedure
Step-by-step for restoring from backup — this is the part people forget to document and regret it later.

1. Reinstall Debian
2. Create Compose File and give U + X permissions
3. Paste from Notepad and sudo ./(file name)

## Last Tested Restore
- **Date:**
- **Result:**
- **Notes:**


