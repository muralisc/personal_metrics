YOUR_GRAFANA_URL="http://mirkwood:3000"
YOUR_GRAFANA_ADMIN_ACCOUNT=admin
YOUR_GRAFANA_ADMIN_PASSWORD=adminp
YOUR_BACKUP_FOLDER_ON_THE_HOST=$PWD/
YOUR_GRAFANA_TOKEN="eyJrIjoiaU9OSzU3M0xwTjcwdWF5OVBHRVR0U2hqSTZMajUwY2oiLCJuIjoiYXNkZiIsImlkIjoxfQ=="
THE_ARCHIVED_FILE_NAME=${1:-202204222346.tar.gz}

docker run --user $(id -u):$(id -g) --rm --name grafana-backup-tool \
           -e GRAFANA_TOKEN=${YOUR_GRAFANA_TOKEN} \
           -e GRAFANA_URL=${YOUR_GRAFANA_URL} \
           -e GRAFANA_ADMIN_ACCOUNT=${YOUR_GRAFANA_ADMIN_ACCOUNT} \
           -e GRAFANA_ADMIN_PASSWORD=${YOUR_GRAFANA_ADMIN_PASSWORD} \
           -e VERIFY_SSL=False \
           -e RESTORE="true" \
           -e ARCHIVE_FILE=${THE_ARCHIVED_FILE_NAME} \
           -v ${YOUR_BACKUP_FOLDER_ON_THE_HOST}:/opt/grafana-backup-tool/_OUTPUT_  \
	   ysde/docker-grafana-backup-tool
