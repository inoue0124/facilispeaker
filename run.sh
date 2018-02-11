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

# 作業ディレクトリの設定
json=`cat ./json/$1.json`
agenda_items=`echo ${json}|jq .agenda |jq length`
data_dir=./data/$1

# 必要なtts音声ファイルを準備
tts_dir=${data_dir}/tts
mkdir -p ${tts_dir}
cp ./speech/*.mp3 ${tts_dir}
./scripts/json2list ./json/$1.json ${tts_dir}/list
cat ${tts_dir}/list | while read line
do
  #./scripts/save_tts ${tts_dir} $line
  echo $line
done

# 必要なBGMを用意
bgm_dir=${data_dir}/bgm
mkdir -p ${bgm_dir}
for((i=0;i<${agenda_items};i++)); do
  class=`echo $json|jq -r .agenda[$i].class`
  case ${class} in
    "報告" ) bgm=spirits.mp3 ;;
    "討議" ) bgm=relax.mp3 ;;
    "承認" ) bgm=morning.mp3 ;;
  esac
  
  if [ ${class} == "承認" ]; then
    cp ./bgm/${bgm} ${bgm_dir}/0$i.mp3
  else
    duration=`soxi -D bgm/${bgm}`
    time=$((`echo $json|jq -r .agenda[$i].time` * 60))
    from=$(($RANDOM % $((${duration%.*}-${time})) ))
    sox ./bgm/${bgm} ${bgm_dir}/0$i.mp3 trim $from $time fade 3 $time 3
  fi
done
read -p "Hit enter to start: "

# 会議を進行する。
play ${tts_dir}/start0{1..3}.mp3
read -p "Hit enter: "
play `ls -ld $(find ${tts_dir}) | awk '{print $9}' | \
	grep start | grep -v start0[1-3]`
for((i=0;i<${agenda_items};i++)); do
  play ${tts_dir}/agenda0$i.mp3
  play ${tts_dir}/time01.mp3
  play ${tts_dir}/time02.mp3
  play ${tts_dir}/summary0$i.mp3
  play ${tts_dir}/stop0$i.mp3
  read -p "Hit enter: "
done

