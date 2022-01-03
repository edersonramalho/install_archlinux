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

tput bold;tput setaf 0;tput setab 7;
echo ""
echo "                                                                 "
echo "----------------[Pos Instalação Arch Linux (Gui)]----------------"
echo "                                                                 "
echo ""
tput sgr0

echo "${_BOLD}${_BLACK}${_BR}"
echo "                                                                 "
echo "----------------[Pos Instalação Arch Linux (Gui)]----------------"
echo "                                                                 "
echo "${_RESET}"

dthr="$(date '+%Y%m%d%H%M')"

arq="${dthr}_log.log"

dir="$(pwd)"

echo $arq
echo $dir

RED='\033[0;31m'
NC='\033[0m' # No Color
printf "I ${RED}love${NC} Stack Overflow\n"

# Continued from above example
echo -e "I ${RED}love${NC} Stack Overflow"

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo "${red}red text ${green}green text${reset}"

echo "${_BOLD}${_GREEN}===>${_RESET}${_BOLD} Pos Instalação Arch Linux${_RESET}"
