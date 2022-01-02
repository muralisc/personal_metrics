

# Create Folder
folder_json=$(curl 'http://admin:admin@localhost:3000/api/folders' \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{"title": "Personal Finance Dash"}' | jq '.')

# Create Dashboard
curl 'http://admin:admin@localhost:3000/api/dashboards/db' \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{
  "dashboard": {
    "id": null,
    "uid": null,
    "title": "Personal Finance Dash",
    "tags": [ "templated" ],
    "timezone": "browser",
    "schemaVersion": 16,
    "version": 0,
    "refresh": "25s"
  },
  "folderId": 0,
  "folderUid": "QwKjUAAnz",
  "message": "Made changes to xyz",
  "overwrite": false
}' | jq '.'


curl 'http://admin:admin@localhost:3000/api/dashboards/db' \
  -X POST \
  -H "Content-Type: application/json" \
  -d "@grafana_docker_dir/provisioning/dashboards/grafana_dash_finance_forecast1.json"


# Update Dashboard

# Seach all dashboards
curl 'http://admin:admin@localhost:3000/api/search?folderIds=0&query=&starred=false'

# Download add the dashboards
HOST="http://admin:admin@localhost:3000"
for dash in $(curl -s 'http://admin:admin@localhost:3000/api/search?query=&starred=false' | jq -r '.[].uid'); do 
  curl 'http://admin:admin@localhost:3000/api/dashboards/db/'$dash > $dash.json 
done
