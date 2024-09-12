# Caddy GM
We want a specific Caddy Web Server Image that works with our GM Deployments. We are using this as a migration from nginx. This is a 
specific caddy build that supports the below:
1. Rate Limiting
2. GeoBlocking & Control
## Usage
You can find the docker-compose configuration snippet example here:
```
  caddy:
    image: ghcr.io/generalmagicio/gm-caddy:latest
    container_name: caddy
    restart: unless-stopped
    networks:
      - mynetwork
    ports:
      - 80:80
      - 443:443
    env_file:
      - .env
    environment:
      MY_URL = ${MY_URL:-}
      IP_WHITELIST: ${IP_WHITELIST:-}
    volumes:
      - caddy_data:/data
      - caddy_config:/config
      - ./Caddyfile:/etc/caddy/Caddyfile
```
