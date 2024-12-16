#!/usr/bin/env bash

set -euo pipefail

cat <<'EOF' > /etc/sysconfig/nftables.conf
include "/etc/nftables/conf.d/*.conf"
EOF

mkdir -p /etc/nftables/conf.d

systemctl enable nftables.service
