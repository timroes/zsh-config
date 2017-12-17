alias docker-ips='docker ps --format "{{.ID}}" | xargs docker inspect -f "{{.Name}} --- {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"'
