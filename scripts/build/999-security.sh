#!/usr/bin/env bash

set -euox pipefail

update-crypto-policies --no-reload --set FIPS

dnf install -y authselect
authselect select minimal --force

dnf copr enable -y packit/OpenSCAP-openscap-maint-1.3 centos-stream-${OS_VERSION}-x86_64
dnf install -y openscap-utils scap-security-guide openscap-engine-sce
mv /usr/bin/oscap-bootc.new /usr/bin/oscap-bootc

oscap-bootc --profile xccdf_org.ssgproject.content_profile_cis --fetch-remote-resources /usr/share/xml/scap/ssg/content/ssg-almalinux${OS_VERSION}-ds.xml

dnf remove -y openscap-utils scap-security-guide openscap-engine-sce
dnf copr remove -y packit/OpenSCAP-openscap-maint-1.3
