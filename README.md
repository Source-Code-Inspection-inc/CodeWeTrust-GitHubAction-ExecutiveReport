# Scan your code with CodeWeTrust

Perform source code analysis with [CodeWeTrust](https://codewetrust.com) scanner and generate Executive Report in pptx format.

![CodeWeTrust Header!](CodeWeTrust_header.png)

### Usage Example

```yaml
name: Run CodeWeTrust Executive Report

on: workflow_dispatch

jobs:
  cwt-analysis:
    runs-on: ubuntu-20.04

    steps:
    - name: Checkout
      uses: actions/checkout@v2
      with:
        fetch-depth: 0 # avoid shallow clone so that Git history analysis works

    - name: CodeWeTrust Analysis
      uses: Source-Code-Inspection-inc/CodeWeTrust-GitHubAction-ExecutiveReport@v0.13
      with:
        licenseKey: ${{ secrets.CWT_LICENSE_KEY }}

    - name: Upload Report
      uses: actions/upload-artifact@v2
      with:
        name: Reports
        path: ExecutiveReport.pptx
```
