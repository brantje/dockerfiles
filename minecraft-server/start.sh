#!/bin/sh

set -e
usermod --uid $UID minecraft
groupmod --gid $GID minecraft

chown -R minecraft:minecraft /data /start-minecraft
chmod -R g+wX /data /start-minecraft

while lsof -- /start-minecraft; do
  echo -n "."
  sleep 1
done
exec /start-minecraft
