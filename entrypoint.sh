#!/bin/bash

set -e

./CodeWeTrustRunner ${INPUT_PATH} --product-name "TODO_HOW_TO_GET_REPO_NAME" --PipelineSettings:LicenseKey ${INPUT_LICENSEKEY} ${INPUT_ARGS}
