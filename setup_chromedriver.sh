#!/usr/bin/env bash
# TODO: update to 89.0.4389.23
# TODO: remove nw linux32, because last 2014's existing version is 2.9 nor 72!
# TODO: add mac64_m1
# TODO: update script (use Ruby, Nokogiri) and parse LATEST_RELEASE
#       on https://chromedriver.storage.googleapis.com
set -e

#make sure we have everything needed to do the setup
NEEDED_UTILS=( \
  "wget" \
  "unzip" \
  "tar" \
)
for util in ${NEEDED_UTILS[*]}
do
  command -v $util >/dev/null 2>&1 || { echo >&2 "I require $util but it's not installed.  Aborting."; exit 1; }
done

#Depending on the OS, figure out which chromedriver and phantomjs to download
#This hasnt been tested on windows, sooo....
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  #is it 32 or 64 bit linux...
  MACHINE_TYPE=`uname -m`
  if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    # 64-bit stuff here
    FilesToDownload=( \
      "https://chromedriver.storage.googleapis.com/72.0.3626.7/chromedriver_linux64.zip" \
    )
  else
    # 32-bit stuff here
    FilesToDownload=( \
      "https://chromedriver.storage.googleapis.com/72.0.3626.7/chromedriver_linux32.zip" \
    )
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  FilesToDownload=( \
    "https://chromedriver.storage.googleapis.com/72.0.3626.7/chromedriver_mac64.zip" \
  )
elif [[ "$OSTYPE" == "win32" ]]; then
  FilesToDownload=( \
    "https://chromedriver.storage.googleapis.com/72.0.3626.7/chromedriver_win32.zip" \
  )
else
  echo "Unable to detect your OS type"
  exit
fi


#make the directory where we'll keep the packages we download
mkdir -p "path_ext/tmp"

# GET PLUGINS
for download_url in ${FilesToDownload[*]}
do
  basename=${download_url##*/}
  file_path="path_ext/tmp/$basename"
  if [ ! -e $file_path ]
  then
    wget -x \
      -O $file_path \
      $download_url
  fi
done

# EXTRACT PLUGINS
pushd path_ext
shopt -s nullglob #need this for cases where no .tar.bz2 files
for p in tmp/*.zip; do unzip -n -q $p; done
for p in tmp/*.tar.bz2; do tar jxf $p; done
for p in tmp/*.tar.gz; do tar xzf $p; done
popd

echo "Setup successful"
