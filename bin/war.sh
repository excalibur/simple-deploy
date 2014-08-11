#!/bin/bash

# Author : faith
# 打包命令

if [ -z "$DEPLOY_HOME" ]; then
	DEPLOY_HOME=${PWD%/*}
fi
echo $DEPLOY_HOME
if [ -z "$env" ]; then
	ENVS=`ls $DEPLOY_HOME/config`

	select env in $ENVS; do
		if [ $env ]; then
			echo -e "[INFO] Set environment to \033[32m$env\033[0m"
			break;
		else
			echo "[INFO] Please select correct number"
		fi
	done;
fi


if [ -e "$DEPLOY_HOME/gradlew" ]; then
	echo "\033[33m[INFO]\033[0m Run gradlew Task [$env]"
	cd $DEPLOY_HOME;$DEPLOY_HOME/gradlew $env
	if [ $? -ne 0 ]; then 
	  echo "\033[31m[ERROR]\033[0m found in: gradlew $env"
	  exit 1
	fi
else
	echo "\033[31m[ERROR]\033[0m not found gradlew file"
fi
