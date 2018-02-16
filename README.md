# Facilispeaker
This program facilitates discussions by keeping schedule and playing BGMs.

## Description
This program is intended to be installed on RaspberryPi. Facilispeaker behaves as if it's a facilitator of discussions by alarming time limit and assigning the speakers of corresponding agenda.

## Usage
### Install
```sh
git clone https://github.com/facilispeaker.git
cd facilispeaker
```
You must install in advance sox(comand line sound player), xmllint(xml parser), jq(json parser) and do pip pynput(if you want to use keyboard sampler).

Then, you can execute next command to start a example project.
```sh
bash run.sh 01 hikari
```

01 is a project name saved in json directory, and hikari is character name of HOYA VoiceText web api(http://voicetext.jp/). You can use 6 characters. See the web site.

### Settings
Add facilispeaker/scripts to system path.

## License
Free
