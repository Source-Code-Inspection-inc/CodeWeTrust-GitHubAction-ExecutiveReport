#!/bin/bash

CodeWeTrustRunner ${INPUT_PATH} --product-name ${GITHUB_REPOSITORY} --PipelineSettings:LicenseKey ${INPUT_LICENSEKEY} ${INPUT_ARGS}
