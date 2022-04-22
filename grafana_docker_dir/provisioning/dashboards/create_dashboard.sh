echo "If fails, remove id in dashboard"
curl -u admin:adminp -X POST -H 'Content-Type: application/json' -d '@Personal_Finance.json' http://localhost:3000/api/dashboards/db | jq
curl -u admin:adminp -X POST -H 'Content-Type: application/json' -d '@All_data.json' http://localhost:3000/api/dashboards/db | jq
curl -u admin:adminp -X POST -H 'Content-Type: application/json' -d '@Mirkwood_stats1.json' http://localhost:3000/api/dashboards/db | jq
