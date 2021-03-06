#!/bin/bash

echo "Starting..."
echo $arg

FAIL_CODE=6

LRED="\033[1;31m"   # Light Red
LGREEN="\033[1;32m" # Light Green
NC='\033[0m'        # No Color

status=0

check_status() {

  curl -sf "${1}" >/dev/null

  if [ ! $? = ${FAIL_CODE} ]; then
    echo -e "${LGREEN}${1} is online${NC}"
    ./telegram.sh -t "${TELEGRAM_TOKEN}" -c "${TELEGRAM_CHAT_ID}" "${1} is online"
  else
    echo -e "${LRED}${1} is down${NC}"
    ./telegram.sh -t "${TELEGRAM_TOKEN}" -c "${TELEGRAM_CHAT_ID}" "${1} is down"
    status=1
  fi
}

for arg; do
  check_status "$arg"
done

if (( status )); then
  exit 1
fi