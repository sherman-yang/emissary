#!/usr/bin/env bash
set -euo pipefail

: "${GATEWAY_URL:?GATEWAY_URL must be set}"
: "${KAT_CLIENT:?KAT_CLIENT must point to the kat-client host binary}"

if [[ ! -x "${KAT_CLIENT}" ]]; then
    echo "error: ${KAT_CLIENT} is not executable" >&2
    exit 1
fi

query=$(cat <<EOF
[
  {
    "url": "${GATEWAY_URL}/echo.EchoService/Echo",
    "grpc_type": "real"
  }
]
EOF
)

for i in $(seq 1 30); do
    response=$(echo "${query}" | "${KAT_CLIENT}" 2>/tmp/e2e-kat-stderr || true)
    status=$(jq -r '.[0].result.status // empty' <<<"${response}" 2>/dev/null || true)
    grpc_status=$(jq -r '.[0].result.headers["Grpc-Status"][0] // empty' <<<"${response}" 2>/dev/null || true)
    err=$(jq -r '.[0].result.error // empty' <<<"${response}" 2>/dev/null || true)
    if [[ "${status}" == "200" && "${grpc_status}" == "0" ]]; then
        echo "ok: gRPC echo round-tripped through Emissary (status=200, grpc-status=0)"
        jq '.[0].result' <<<"${response}" 2>/dev/null || echo "${response}"
        exit 0
    fi
    echo "attempt ${i}: status=${status:-none} grpc-status=${grpc_status:-none} error=${err:-none}"
    sleep 2
done

echo "verify failed: gRPC echo call never succeeded through ${GATEWAY_URL}" >&2
echo "last response:" >&2
echo "${response}" >&2
echo "--- kat-client stderr ---" >&2
cat /tmp/e2e-kat-stderr 2>/dev/null || true
exit 1
