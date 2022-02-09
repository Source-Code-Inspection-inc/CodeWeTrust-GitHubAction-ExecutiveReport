# CodeWeTrust Executive Report Generator

Performs source code analysis and generates PowerPoint executive report.

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
