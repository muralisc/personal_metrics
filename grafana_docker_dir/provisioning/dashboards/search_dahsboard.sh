HOST_IP=${1:-localhost}
PASSWORD=${2:-adminp}
DASHBOARDS=$(curl -su admin:$PASSWORD "http://$HOST_IP:3000/api/search/" | jq)
for uid in $(jq -r '.[].uid ' <<< "$DASHBOARDS"); do
	echo $uid
	TITLE=$(jq -r '.[]  | select(.uid == "'$uid'") | .title' <<< "$DASHBOARDS" | sed 's/ /_/')
	curl -su admin:$PASSWORD "http://$HOST_IP:3000/api/dashboards/uid/$uid" | jq > $TITLE.json
done
