#!/bin/bash

# Author : faith
# 回滚命令

if [ -z "$DEPLOY_HOME" ]; then
	DEPLOY_HOME=${PWD%/*}
fi

if [ -z "$DEPLOY_HOME" ]; then
	BACKUP_DIR=$HOME
fi

