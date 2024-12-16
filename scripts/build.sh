#!/usr/bin/env bash

set -euo pipefail

for script in /tmp/scripts/build/*.sh; do
    bash "$script"
done
