#!/bin/bash
git init .
git submodule add -f https://github.com/john-ansible/core.git
cp core/gitignore .gitignore
ln -sf core/ansible.cfg .
ln -sf core/main.yml .
ln -sf core/Makefile .
ln -sf core/requirements.yml .
mkdir -p host_vars
mkdir -p group_vars
mkdir -p files
make up
