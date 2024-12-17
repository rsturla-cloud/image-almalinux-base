#!/usr/bin/env bash

set -euo pipefail

echo -e '[etc]\ntransient=true' >> /usr/lib/ostree/prepare-root.conf
