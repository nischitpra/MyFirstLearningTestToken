#!/bin/bash
LOCAL_DIR=$(pwd)
REMIX_IDE="https://remix.ethereum.org/#optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.7+commit.e28d00a7.js"

tmux new-session -d -s "remixd"
tmux send-keys -t "remixd" "remixd -s $LOCAL_DIR --remix-ide $REMIX_IDE" Enter

sleep 1s

tmux new-session -d -s "browserIde"
tmux send-keys -t "browserIde" "xdg-open $REMIX_IDE" Enter

sleep 1s

gnome-terminal --working-directory=$LOCAL_DIR
