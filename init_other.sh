#!/bin/bash
echo "remove sh origin link;use bash instead"
echo $(sudo rm /bin/sh)
echo $(sudo ln -s /bin/bash /bin/sh)
##init git
echo "start config git"
echo "input your git name"
read username
echo $(git config --global user.name "${username}")
echo "input your git email"
read email
echo $(git config --global user.email "${email}")
echo $(git config --list)
echo 'press enter continue ssh-keygen'
echo $(ssh-keygen -t rsa -C ${email})
echo 'now you can find your public key in .ssh dir'
## init vimplus
echo 'init vimplus'
echo $(git clone https://github.com/chxuan/vimplus.git ~/.vimplus)
echo $(cd ~/.vimplus && bash install.sh)

##huanyuan 
cn_source_16=$"deb-src http://archive.ubuntu.com/ubuntu xenial main restricted #Added by software-properties
deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted multiverse universe #Added by software-properties
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted multiverse universe #Added by software-properties
deb http://mirrors.aliyun.com/ubuntu/ xenial universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe
deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse #Added by software-properties
deb http://archive.canonical.com/ubuntu xenial partner
deb-src http://archive.canonical.com/ubuntu xenial partner
deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted multiverse universe #Added by software-properties
deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-security multiverse
"

cn_source_18=$"deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse"
version=$(lsb_release -r --short)
echo $cn_source_16
echo $version
if [[ $version =~ '16' ]]; then
    echo "current version:${version};choose 16"
    echo "${cn_source_16}" | sudo tee /etc/apt/sources.list
fi
if [[ $version =~ '18' ]]; then
    echo "current version:${version};choose 18"
    echo "${cn_source_18}" | sudo tee /etc/apt/sources.list
fi
echo $(sudo apt-get update&&apt-get upgrade)
##
