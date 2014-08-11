#!/bin/bash

# Author : faith
# 设置部署环境
select env in "prod" "dev"
do
case $env in
"prod")
    echo -e "[INFO] set environment to \033[32m$env\033[0m"
    ;;
"dev")
    echo "stop something"  
    ;;
*)
    echo "Ignorant"  
    ;;
esac
done;