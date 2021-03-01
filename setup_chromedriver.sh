#!/usr/bin/env bash
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
  MACHINE_TYPE=`uname -m`
  if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    # 64-bit stuff here
    FilesToDownload=( \
      "https://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver_linux64.zip" \
    )
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
   #is it 64 bit linux?
  MACHINE_TYPE=`uname -m`
  if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    # amd64 here
    FilesToDownload=( \
      "https://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver_mac64.zip" \
    )
  elif [ ${MACHINE_TYPE} == 'arm64' ]; then
    # mac64_m1 here
    FilesToDownload=( \
      "https://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver__mac64_m1.zip" \
    )
  fi
elif [[ "$OSTYPE" == "win32" ]]; then
  FilesToDownload=( \
    "https://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver_win32.zip" \
  )
else
  echo "Unable to detect your OS type"
  exit
fi


#make the directory where we'll keep the packages we download
mkdir -p "chromedriver_ext/tmp"

# GET PLUGINS
for download_url in ${FilesToDownload[*]}
do
  basename=${download_url##*/}
  file_path="chromedriver_ext/tmp/$basename"
  if [ ! -e $file_path ]
  then
    wget -x \
      -O $file_path \
      $download_url
  fi
done

# EXTRACT PLUGINS
pushd chromedriver_ext
shopt -s nullglob #need this for cases where no .tar.bz2 files
for p in tmp/*.zip; do unzip -n -q $p; done
for p in tmp/*.tar.bz2; do tar jxf $p; done
for p in tmp/*.tar.gz; do tar xzf $p; done
popd

echo "Setup successful"
export PATH="$PATH:$(pwd)/chromedriver_ext"
echo "$PATH" | tail -c 80
