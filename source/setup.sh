#!/usr/bin/env bash

original=`sed -n '/GETH_HOSTNAME = /p' app/app.js | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'`

function logInfo(){
    echo "[INFO] :: " $1
}

function setGethIP(){
    sed -i '9s/'"$1"'/'"$2"'/' app/app.js
}

logInfo "!!app.js line 9!!"

if [[ ${original} == "" ]];then
    logInfo "original ip : localhost"
    setGethIP "localhost" ${GETH_HOST}
else
    logInfo "original ip : ${original}"
    setGethIP ${original} ${GETH_HOST}
fi

logInfo "change : ${GETH_HOST}"

npm start