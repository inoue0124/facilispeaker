#!/bin/bash
# facilispeakerのメインスクリプト
# usage:./run.sh [agenda name (Not required suffix)]
# Author:Inoue


set -ex
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
#./scripts/list2tts ${tts_dir}/list ${tts_dir}


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
  
  time=$((`echo $json|jq -r .agenda[$i].time` * 60))
  if [ $time -lt 600 ]; then # 予定時間が10分より短かったら
    alarm=180 # 3分前にお知らせ
    alarm_tts=time02.mp3
  else # 予定時間が10分より長かったら
    alarm=300 # 5分前にお知らせ
    alarm_tts=time01.mp3
  fi

  if [ ${class} == "承認" ]; then # 承認の時はBGM固定
    cp ./bgm/${bgm} ${bgm_dir}
    sox -n -r 44100 -c 2 ${bgm_dir}/silence.mp3 \
	    trim 0 $((time-alarm)) gain -n -6
    sox -m ${bgm_dir}/morning.mp3 ${bgm_dir}/silence.mp3 \
	    ${bgm_dir}/0${i}_a.mp3 gain -n -6
    sox -n -r 44100 -c 2 ${bgm_dir}/0${i}_b.mp3 \
	    trim 0 $((alarm-60)) gain -n -6
  else
    duration=`soxi -D bgm/${bgm}`
    from=$(($RANDOM % $((${duration%.*}-${time})) ))
    sox ./bgm/${bgm} ${bgm_dir}/0${i}_a.mp3 trim $from $((time-alarm)) \
	    fade 3 $((time-alarm)) 3 gain -n -6
    sox ./bgm/${bgm} ${bgm_dir}/0${i}_b.mp3 trim $from $((alarm-60)) \
	    fade 3 $((alarm-60)) 3 gain -n -6
  fi
done
play ${tts_dir}/system01.mp3
play ${tts_dir}/system02.mp3
read -p "Hit enter to start: " # 音声コマンド認識


# 会議を進行する。
play `ls -ld $(find ${tts_dir}) | awk '{print $9}' | \
	grep start | grep -v start0[1-3]`

for((i=0;i<${agenda_items};i++)); do
  play ${tts_dir}/agenda0$i.mp3
  play ${bgm_dir}/0${i}_a.mp3
  play ${tts_dir}/${alarm_tts}
  play ${bgm_dir}/0${i}_b.mp3
  play ${tts_dir}/time03.mp3
  play ${tts_dir}/summary0${i}.mp3
  sleep 60 # 1分間音声認識書き起こし
  play ${tts_dir}/stop0${i}.mp3
  read -p "Hit enter: " # 音声コマンド認識
done

play ${tts_dir}/assign01.mp3


