#!/bin/bash




##### FZY ############

FZY_URL="https://api.github.com/repos/jhawthorn/fzy/releases/latest"
FZY_PATH="$HOME/.local/bin/fzy"
curl -s $FZY_URL | grep "browser_download_url" | \
  grep -E "gz\"$" | awk '{ print $2 }' | \
  xargs wget -P "${FZY_PATH}/"

ZIP_FILE=`ls "${FZY_PATH}/" | grep -E "fzy.*\.tar\.gz$"`

tar xzf "${FZY_PATH}/${ZIP_FILE}" -C "${FZY_PATH}"
rm "${FZY_PATH}/${ZIP_FILE}"

FZY_COMPILE=`ls "${FZY_PATH}" | grep -E "fzy\-.*"`

cd "${FZY_PATH}/${FZY_COMPILE}" && make && sudo make install
#mv "${EXA_PATH}/${EXA_BIN}" "${EXA_PATH}/exa"
rm "${FZY_PATH}" -rf
echo FZY - installed.

##### END EXA #######



