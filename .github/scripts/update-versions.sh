#!/bin/sh

set -ae

cd "$(dirname "$0")/../.."

getLatestReleaseTag() {
  echo "Checking latest release version for $1..." > /dev/stderr
  V=$(gh release view --repo "$1" --json tagName --template '{{.tagName}}')
  if [ -n "$2" ]; then V="${V#$2}"; fi
  if [ -n "$3" ]; then V="${V%$3}"; fi
  echo "$V"
}

PARLA_VERSION=$(getLatestReleaseTag trufae/parla)
DELTACHAT_VERSION=$(getLatestReleaseTag chatmail/core v)

echo "Updating versions in snap/snapcraft.yaml..." > /dev/stderr
yq eval -i '.parts.parla.source-tag=strenv(PARLA_VERSION) | 
  .parts.deltachat-rpc-server.build-environment[0].DELTACHAT_VERSION=strenv(DELTACHAT_VERSION)
  ' snap/snapcraft.yaml
