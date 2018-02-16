#!/bin/bash
# facilispeakerのメインスクリプト
# usage:./run.sh [agenda name (Not required suffix)]
# Author:Inoue


set -x
# コマンドパーサ
CMDNAME=`basename $0`
if [ $# -lt 1 ] || \
   [ `echo $1 | grep "\."` ] || \
   [ ! -e ./json/$1.json ] || \
   [ ! -d ./speech/$2 ]; then
  echo "Usage: ${CMDNAME} [agenda name (Not required suffix)] [char name]" 1>&2
  echo "usage: [char name] = hikari, show, santa, bear"
  exit 1
fi


# 音量設定
vol=20 # 全体の音量
bgm_vol=-15 # BGMの音量（マイナスの値を推奨）
char_name=$2


# 作業ディレクトリの設定
json=`cat ./json/$1.json`
agenda_items=`echo ${json}|jq .agenda |jq length`
data_dir=./data/$1


# julius認識サーバ起動
pkill -f julius
./scripts/start_julius


# 必要なtts音声ファイルを準備
tts_dir=${data_dir}/tts/${char_name}
rec_dir=${data_dir}/rec
mkdir -p ${tts_dir} ${rec_dir}
if [ ! `ls ${tts_dir}/*.wav` ]; then
  ./scripts/json2list ./json/$1.json ${tts_dir}/list
  ./scripts/list2tts ${tts_dir}/list ${tts_dir} ${char_name}
fi
cp ./speech/${char_name}/*.wav ${tts_dir}

# ファイル生成の完了を報告
./scripts/set_volume ${vol}
play ${tts_dir}/system01.wav
play ${tts_dir}/system02.wav
python3 ./scripts/voice_command.py ${char_name} # 音声コマンド認識


# 会議を進行する。
play ${tts_dir}/start*.wav

for((i=0;i<${agenda_items};i++)); do
  if [ ! $i == 0 ]; then
    play ${tts_dir}/next01.wav
  fi
  play ${tts_dir}/agenda0$i.wav
  ./scripts/play_bgm $1 $i a ${tts_dir} ${bgm_vol}
  ./scripts/play_bgm $1 $i b ${tts_dir} ${bgm_vol}
  play ${tts_dir}/summary0${i}.wav
  python3 ./scripts/sleep.py 60
  pkill -f julius
  ./scripts/start_julius # julius認識サーバ起動
  play ${tts_dir}/finish01.wav
  play ${tts_dir}/stop0${i}.wav
  python3 ./scripts/voice_command.py ${char_name} # 音声コマンド認識
done

play ${tts_dir}/assign01.wav
python3 ./scripts/sleep.py 60
play ${tts_dir}/finish02.wav

pkill -f julius

