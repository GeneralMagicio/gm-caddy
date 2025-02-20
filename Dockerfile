FROM caddy:2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-ratelimit \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/muety/caddy-remote-host \
    --with github.com/caddy-dns/godaddy \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY access-denied.html /opt/access-denied.html