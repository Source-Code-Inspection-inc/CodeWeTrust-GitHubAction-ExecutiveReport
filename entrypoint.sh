#!/bin/bash

set -e

./CodeWeTrustRunner ${INPUT_PATH} --product-name ${{ github.event.repository.name }} --PipelineSettings:LicenseKey ${INPUT_LICENSEKEY} ${INPUT_ARGS}
