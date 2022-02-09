#!/bin/bash

echo "INPUT_PATH: ${INPUT_PATH}"
echo "GITHUB_REPOSITORY: ${GITHUB_REPOSITORY}"
echo "INPUT_ARGS: ${INPUT_ARGS}"

if [[ -z "${INPUT_LICENSEKEY}" ]]; then
  echo "License key is not set. Check licenseKey action parameter."
  exit 1
fi

if [[ -z "${INPUT_PATH}" ]]; then
  INPUT_PATH="."
fi

echo "Command: CodeWeTrustRunner ${INPUT_PATH} --product-name ${GITHUB_REPOSITORY} --PipelineSettings:LicenseKey ${INPUT_LICENSEKEY} --PipelineSettings:WriteExecutiveReport true ${INPUT_ARGS}"

CodeWeTrustRunner ${INPUT_PATH} --product-name ${GITHUB_REPOSITORY} --PipelineSettings:LicenseKey ${INPUT_LICENSEKEY} --PipelineSettings:WriteExecutiveReport true ${INPUT_ARGS}
