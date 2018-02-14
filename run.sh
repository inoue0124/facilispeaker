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

# 音量設定
vol=10 # 全体の音量
bgm_vol=-15 # BGMの音量（マイナスの値を推奨）

# 作業ディレクトリの設定
json=`cat ./json/$1.json`
agenda_items=`echo ${json}|jq .agenda |jq length`
data_dir=./data/$1


# julius認識サーバ起動
./scripts/kill_server
./scripts/start_julius


# 必要なtts音声ファイルを準備
tts_dir=${data_dir}/tts
rec_dir=${data_dir}/rec
mkdir -p ${tts_dir} ${rec_dir}
cp ./speech/*.mp3 ${tts_dir}
./scripts/json2list ./json/$1.json ${tts_dir}/list
./scripts/list2tts ${tts_dir}/list ${tts_dir}


# ファイル生成の完了を報告
./scripts/set_volume ${vol}
play ${tts_dir}/system01.mp3
play ${tts_dir}/system02.mp3
python3 ./scripts/voice_command.py # 音声コマンド認識


# 会議を進行する。
play `ls -ld $(find ${tts_dir}) | awk '{print $9}' | \
	grep start | grep -v start0[1-3]`

for((i=0;i<${agenda_items};i++)); do
  play ${tts_dir}/agenda0$i.mp3
  ./scripts/play_bgm $1 $i a ${tts_dir} ${bgm_vol}
  ./scripts/play_bgm $1 $i b ${tts_dir} ${bgm_vol}
  play ${tts_dir}/summary0${i}.mp3
  read -p "Hit enter to start recording: "
  python3 ./scripts/rec.py ${rec_dir}/summary0${i}
  ./scripts/kill_server
  ./scripts/start_julius # julius認識サーバ起動
  play ${tts_dir}/finish01.mp3
  play ${tts_dir}/stop0${i}.mp3
  python3 ./scripts/voice_command.py # 音声コマンド認識
done

play ${tts_dir}/assign01.mp3
read -p "Hit enter to start recording: "
python3 ./scripts/rec.py ${rec_dir}/todo
play ${tts_dir}/finish02.mp3

./scripts/kill_server

