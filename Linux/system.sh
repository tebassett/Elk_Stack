#!/bin/bash
#Free memory to free_mem.txt
cat /proc/meminfo | head -2 | tail -1 >> ~/backups/freemem/free_mem.txt
#Disk usage to disk_usage.txt
du -h >> ~/backups/diskuse/disk_usage.txt
#List all open files to open_list.txt
lsof >> ~/backups/openlist/open_list.txt
#System disk space stats to free_disk.txt
df -h >> ~/backups/freedisk/free_disk.txt