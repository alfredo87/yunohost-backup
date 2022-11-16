# yunohost-backup
## 1. INTRODUCTION

This project tries to create a simple non-encrypted backup and restore system for a yunohost server.
It is a script that creates a backup in the folder /home/yunohost.backup/archives
with the prefix "automatic-" and followed by the date "YEAR-MONTH-DAY" (e.g. automatic-2022-11-15.tar )
The script is a shell script based on a yunohost user that applied it to restic backups (thank you but I forgot your name!)
Since my server is very small and has a limted number of users I am not interested in encrypting the backups:
it seems a bit of an overkill.
The strategy for backing up is to keep three backups on the server and export them daily to a hard disk drive connected by USB (or firewire) to my desktop.
So, three backups are kept on the yunohost server and can be used to restore the system and apps directly from the web admin.
The software used is called rsnappush  and needs to be downloaded and installed from [osdn.net](https://osdn.net/users/ftobin/pf/rsnappush/wiki/FrontPage).
rsnappush is written by [Frank Tobin](https://www.neverending.org/)
## 2.Installation
### Dependencies:
After downloading rsnappush extract the archive and run ``setup.py``
Copy the script into ``/etc/cron.daily`` as ``check_backup``. It will backup the yunohost server evry day.
The disk on the desktop machine is called ``bup`` and is mounted on ``/Volumes/bup`` on my imac.
Change it as required.
