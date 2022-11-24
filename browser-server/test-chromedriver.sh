#!/bin/bash

# chromedriver_path=$(command -v chromedriver)
chromedriver_path="chromedriver"
chromedriver_version=$("${chromedriver_path}" --version)
chromedriver_major_version=$("${chromedriver_path}" --version | cut -f 2 -d " " | cut -f 1 -d ".")

# chrome_path="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
chrome_path="google-chrome"
chrome_version=$("${chrome_path}" --version)
chrome_major_version=$("${chrome_path}" --version | sed -e 's/Google Chrome //g' | cut -f 1 -d ".")

if [ $chromedriver_major_version = $chrome_major_version ]; then
    echo "versions ok"
    exit 0
else
    echo "Wallaby often fails with 'invalid session id' if Chromedriver and Chrome have different versions."
    echo "Chromedriver version : ${chromedriver_version} (${chromedriver_path})"
    echo "Google Chrome version: ${chrome_version} (${chrome_path})"
    exit 1
fi
