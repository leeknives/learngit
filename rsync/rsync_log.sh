#!/bin/sh
/usr/bin/rsync -avh /data/web/worker/logs/* /data/service_logs/worker_logs
/usr/bin/rsync -avh /data/web/open-api/Project2/Runtime/Logs/*  /data/service_logs/open-api_logs
/usr/bin/rsync -avh /data/web/file-server/Apps/Runtime/Logs/*  /data/service_logs/file-server_logs
/usr/bin/rsync -avh /data/web/laoshi/APP/Runtime/Logs/*  /data/service_logs/laoshi_logs
/usr/bin/rsync -avh /data/web/public-server/App/Runtime/Logs/* /data/service_logs/public-server_logs
/usr/bin/rsync -avh /data/web/manage/APP/Runtime/Logs/* /data/service_logs/manage_logs
