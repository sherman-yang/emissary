#!/usr/bin/env bash
set -euo pipefail

: "${GATEWAY_URL:?GATEWAY_URL must be set}"
: "${KAT_CLIENT:?KAT_CLIENT must point to the kat-client host binary}"

query=$(cat <<EOF
[
  {
    "url": "${GATEWAY_URL}/backend/probe",
    "method": "GET"
  }
]
EOF
)

for i in $(seq 1 30); do
    response=$(echo "${query}" | "${KAT_CLIENT}" 2>/tmp/e2e-kat-stderr || true)
    status=$(jq -r '.[0].result.status // empty' <<<"${response}" 2>/dev/null || true)
    backend=$(jq -r '.[0].result.json.backend // empty' <<<"${response}" 2>/dev/null || true)
    if [[ "${status}" == "200" && "${backend}" == "http-echo" ]]; then
        echo "ok: HTTP Mapping routed to kat-server backend '${backend}'"
        jq '.[0].result' <<<"${response}" 2>/dev/null || echo "${response}"
        exit 0
    fi
    echo "attempt ${i}: status=${status:-none} backend=${backend:-none}"
    sleep 2
done

echo "verify failed: HTTP Mapping never returned 200 from backend=http-echo at ${GATEWAY_URL}/backend/" >&2
echo "last response:" >&2
echo "${response}" >&2
echo "--- kat-client stderr ---" >&2
cat /tmp/e2e-kat-stderr 2>/dev/null || true
exit 1
