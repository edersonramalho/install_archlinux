#!/bin/bash

_BLACK=$(tput setaf 0)
_RED=$(tput setaf 1)
_GREEN=$(tput setaf 2)
_BLUE=$(tput setaf 4)
_BRANCO=$(tput setaf 7)
_RESET=$(tput sgr0)
_BOLD=$(tput bold)
_BR=$(tput setab 7)

clear

tput reset

echo "${_BOLD}${_BLACK}${_BR}"
echo "                                                                 "
echo "----------------[Pos Instalação Arch Linux (Gui)]----------------"
echo "                                                                 "
echo "${_RESET}"

dthr="$(date '+%Y%m%d%H%M')"

arq="${dthr}_log.log"

dir="$(pwd)""/tt"

echo $arq
echo $dir

cd ${dir}

if [ -d "$dir" ];then
  # se o diretório existir
  #touch "$dir"/"$file"
  echo "Existe"
else
  # se não existir, vai ser criado o diretório
  mkdir "$dir"; #touch "$dir"/"$file"
fi

path_download="$HOME/Downloads/teste"
path_pwd="$(pwd)"

#path_download CRIAR
#mkdir ${path_download}

if [ -d "$path_download" ];then
  # se o diretório existir
  #touch "$dir"/"$file" 
  echo "Existe" 
else
  # se não existir, vai ser criado o diretório
  mkdir ${path_download}; 
  #touch "$path_download"/"$arquivo_log"
  echo "Criado" 
fi
