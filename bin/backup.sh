#!/bin/bash

# Author : faith
# 备份命令

if [ -z "$DEPLOY_HOME" ]; then
	DEPLOY_HOME=${PWD%/*}
fi

if [ -z "$DEPLOY_HOME" ]; then
	BACKUP_DIR=$HOME
fi

# 备份
# 有备份路径才备份
if [ -n "$BACKUP_DIR" -a -d "$BACKUP_DIR" ]
 then
	echo -e "\033[33mBackup project \033[0m"
	# 循环项目名称 然后备份
	for project in $PROJECTS; do
		mv $project $BACKUP_DIR/$PROJECT_NAME-$NOW_TIME.$EXT_NAME
		echo $BACKUP_DIR/$PROJECT_NAME-$NOW_TIME.$EXT_NAME
	done
fi