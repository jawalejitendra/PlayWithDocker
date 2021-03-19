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
    ls
    ;;
  nodeVersion)
    node --version
    ;;
  *)
    exec "$@"
    ;;
esac
