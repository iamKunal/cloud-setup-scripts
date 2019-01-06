#!/bin/bash




##### EXA ############

EXA_URL="https://api.github.com/repos/ogham/exa/releases/latest"
EXA_PATH="$HOME/.local/bin"
EXA_FILE='exa*.zip'
curl -s $EXA_URL | grep "browser_download_url" | \
  grep linux | awk '{ print $2 }' | \
  xargs wget -P "${EXA_PATH}/"

ZIP_FILE=`ls "${EXA_PATH}/" | grep -E "exa.*\.zip"`

unzip -o "${EXA_PATH}/${ZIP_FILE}" -d "${EXA_PATH}"
rm "${EXA_PATH}/${ZIP_FILE}"

EXA_BIN=`ls "${EXA_PATH}" | grep -E "exa.*linux"`
mv "${EXA_PATH}/${EXA_BIN}" "${EXA_PATH}/exa"

echo EXA - installed.

##### END EXA #######



