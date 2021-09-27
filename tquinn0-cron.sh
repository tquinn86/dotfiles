#! /usr/bin/env bash
set -e

cd ~/code/ghae-kube-main 

git checkout main
git pull

./script/setup -g tquinn0 --pristine 
