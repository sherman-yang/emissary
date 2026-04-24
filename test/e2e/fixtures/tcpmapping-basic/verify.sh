#!/usr/bin/env bash
set -euo pipefail

: "${GATEWAY_URL:?GATEWAY_URL must be set}"
: "${NAMESPACE:?NAMESPACE must be set}"

# GATEWAY_URL is a URL (e.g. http://localhost); strip the scheme to get the
# host we can open a raw TCP socket against.
host="${GATEWAY_URL#*://}"
host="${host%%[:/]*}"
port=6789

kubectl -n "${NAMESPACE}" rollout status deploy/tcp-echo --timeout=60s

backend=$(kubectl -n "${NAMESPACE}" get pod -l app=tcp-echo \
    -o jsonpath='{.items[0].metadata.name}')

for i in $(seq 1 30); do
    # bash's /dev/tcp opens a TCP socket; cat reads until the server closes,
    response=$(timeout 5 bash -c "cat < /dev/tcp/${host}/${port}" 2>/dev/null || true)
    if [[ "${response}" == "${backend}" ]]; then
        echo "ok: TCPMapping routed ${host}:${port} to backend pod '${response}'"
        exit 0
    fi
    echo "attempt ${i}: got '${response:-(empty)}', expected '${backend}'"
    sleep 2
done

echo "verify failed: never got expected hostname on ${host}:${port}" >&2
exit 1
