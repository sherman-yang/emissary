#!/usr/bin/env bash
set -euo pipefail

: "${GATEWAY_URL:?GATEWAY_URL must be set}"
: "${KAT_CLIENT:?KAT_CLIENT must point to the kat-client host binary}"

host="${GATEWAY_URL#*://}"
host="${host%%[:/]*}"

query=$(cat <<EOF
[
  {
    "url": "http://${host}:6789/tcp-probe",
    "method": "GET"
  }
]
EOF
)

for i in $(seq 1 30); do
    response=$(echo "${query}" | "${KAT_CLIENT}" 2>/tmp/e2e-kat-stderr || true)
    status=$(jq -r '.[0].result.status // empty' <<<"${response}" 2>/dev/null || true)
    backend=$(jq -r '.[0].result.json.backend // empty' <<<"${response}" 2>/dev/null || true)
    if [[ "${status}" == "200" && "${backend}" == "tcp-echo" ]]; then
        echo "ok: TCPMapping passed bytes from ${host}:6789 to kat-server backend '${backend}'"
        jq '.[0].result' <<<"${response}" 2>/dev/null || echo "${response}"
        exit 0
    fi
    echo "attempt ${i}: status=${status:-none} backend=${backend:-none}"
    sleep 2
done

echo "verify failed: TCPMapping round-trip never returned 200 from backend=tcp-echo at ${host}:6789" >&2
echo "last response:" >&2
echo "${response}" >&2
echo "--- kat-client stderr ---" >&2
cat /tmp/e2e-kat-stderr 2>/dev/null || true
exit 1
