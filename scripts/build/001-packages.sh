#!/usr/bin/env bash

set -euo pipefail

dnf remove -y \
    sssd* \
    openssh-server

dnf install -y \
    unzip
