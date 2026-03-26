
sudo mkdir -p /srv/containers/appcria/{app,data}

docker run -d \
  --name appcria \
  -v /srv/containers/appcria/app:/app \
  -v /srv/containers/appcria/data:/app/data \
  -e DATABASE_URL=sqlite:////app/data/cria.db \
  -e SECRET_KEY=bd3ed769473891c0f65a239f18bbc754e2cd630e6e25604a0f597f2f1ada9785 \
  -p 5000:5000 \
  --restart unless-stopped \
  urbancompasspony/criaprop:latest
