#!/bin/bash
# facilispeakerのメインスクリプト
# usage:./run.sh [agenda name (Not required suffix)]
# Author:Inoue


# コマンドパーサ
CMDNAME=`basename $0`
if [ $# -lt 1 ] || \
   [ `echo $1 | grep "\."` ] || \
   [ ! -e ./json/$1.json ]; then
  echo "Usage: ${CMDNAME} [agenda name (Not required suffix)]" 1>&2
  exit 1
fi

# 必要なtts音声ファイルを準備
json=`cat ./json/$1.json`
data_dir=./data/$1
mkdir -p ${data_dir}
cp ./speech/*.mp3 ${data_dir}
json2list ./json/$1.json ${data_dir}/list
cat ${data_dir}/list | while read line
do
  save_tts ${data_dir} $line
done


