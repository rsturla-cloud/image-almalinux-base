#!/usr/bin/env bash

set -euo pipefail

dnf clean all

kver=$(cd /usr/lib/modules && echo *)
dracut -vf /usr/lib/modules/$kver/initramfs.img $kver
