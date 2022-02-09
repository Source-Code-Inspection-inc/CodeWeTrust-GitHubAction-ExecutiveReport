#!/bin/bash

echo "INPUT_PATH: ${INPUT_PATH}"
echo "GITHUB_REPOSITORY: ${GITHUB_REPOSITORY}"
echo "INPUT_ARGS: ${INPUT_ARGS}"

if [[ -z "${INPUT_PATH}" ]]; then
  INPUT_PATH="."
fi

CodeWeTrustRunner ${INPUT_PATH} --product-name ${GITHUB_REPOSITORY} --PipelineSettings:LicenseKey ${INPUT_LICENSEKEY} ${INPUT_ARGS}
