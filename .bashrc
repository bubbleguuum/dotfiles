# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

test -s ~/.alias && . ~/.alias 
test -s ~/.functions && . ~/.functions 
test -s ~/.bashrc_private && . ~/.bashrc_private

export PATH=$PATH:~/gradle/bin:~/android-ndk-r18b:~/android-sdk/platform-tools
export BORG_PASSPHRASE BORG_REPO

unset JAVA_BINDIR JAVA_ROOT JAVA_HOME

# Disable ctrl-s and ctrl-q.
stty -ixon

#Allows you to cd into directory merely by typing the directory name.
shopt -s autocd




