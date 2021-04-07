#!/bin/bash
checkov -d . -o json > results.json
exitCode=$?
[[ $exitCode = 0 ]] && state="success" || state="failure"
echo "##vso[task.setvariable variable=CheckovState;]$state"
exit $exitCode
