#!/bin/bash

if [ "${1:0:1}" = '-' ]; then
  export EXTRA_OPTIONS="$@"
  set --
elif [ "${1}" == "postgres" -o "${1}" == "$(which postgres)" ]; then
  export EXTRA_OPTIONS="${@:2}"
  set --
fi

if [ -n "${1}" ]; then
  touch /etc/services.d/$BITNAMI_APP_NAME/down
  touch /etc/services.d/$BITNAMI_APP_NAME-logs/down
fi

exec /init "$@"
