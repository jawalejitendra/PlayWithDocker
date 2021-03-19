#!/bin/bash
set -eo pipefail
echo "Found the entrypoint.sh file"
cd /app

case $1 in
  command1)
    ls
    echo "this is working fine"
    ;;
  command2)
    which google-chrome-stable
    ;;
  nodeVersion)
    node --version
    ;;
  wdio:local)
    Xvfb ${XVFB_DISPLAY} ${XVFB_ARGS} & \
    npm run wdio:local
    ;;
  *)
    exec "$@"
    ;;
esac
