#!/bin/sh


ROOT="/home/divinabiz/"

TARGET_PREPROD="${ROOT}www-dev"
TARGET_PROD="${ROOT}www-dev"

#par defaut, preprod
TO="preprod"
TARGET=$TARGET_PREPROD

REPO="https://divinabiz:Divina456@github.com/divinabiz/stratem.git"

BRANCH="master"

CLONE=false

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
  -branch|-b)
    shift  
  BRANCH=$1
   shift
   ;;
  -prod|-p)
    TO="prod"
    TARGET=$TARGET_PROD
    shift
    ;;
  -clone|-c)
    CLONE=true
    shift
    ;;
    *)
    POSITIONAL+=("$1")
    shift
    ;;
esac
done


if [ $TO = "prod" ]; then
  if [ ! $BRANCH = "master" ]; then
     echo "Seul le MASTER peut etre mis en production";
     BRANCH="master"
  fi
fi
echo "Deploiement de ${BRANCH} sur la ${TO} dans le repertoire : ${TARGET}"



DIRS=(
  "client"
  "client/cache"
  "client/templates_c"
  "client/themes"
  "client/themes/admin-divinabiz"
  "client/themes/admin-divinabiz/log"
  "client/themes/admin-dynasay"
  "client/themes/admin-dynasay/log"
  "client/themes/admin-intuitive"
  "client/themes/admin-intuitive/log"
  "client/themes/affinilove"
  "client/themes/affinilove/log"
  "client/themes/bettyvoyante"
  "client/themes/bettyvoyante/log"
  "client/themes/chat-test"
  "client/themes/chat-test/log"
  "client/themes/chiffresamoureux"
  "client/themes/chiffresamoureux/log"
  "client/themes/chiffresamoureux-responsive"
  "client/themes/chiffresamoureux-responsive/log"
  "client/themes/divinabiz"
  "client/themes/divinabiz/log"
  "client/themes/divinamembre"
  "client/themes/divinamembre/log"
  "client/themes/divinamembre-responsive"
  "client/themes/divinamembre-responsive/log"
  "client/themes/divinapro"
  "client/themes/divinapro/log"
  "client/themes/divinoroscope"
  "client/themes/divinoroscope/log"
  "client/themes/divinoroscope-old"
  "client/themes/divinoroscope-old/log"
  "client/themes/dynasay"
  "client/themes/dynasay/log"
  "client/themes/loveastro"
  "client/themes/loveastro/log"
  "client/themes/rdv_securdv"
  "client/themes/rdv_securdv/log"
  "client/themes/rdv_securdv_2"
  "client/themes/rdv_securdv_2/log"
  "client/themes/reves-divinabiz"
  "client/themes/reves-divinabiz/log"
  "client/themes/voyancecoeur"
  "client/themes/voyancecoeur/log"
  "client/themes/voyancecoeur-responsive"
  "client/themes/voyancecoeur-responsive/log"
  "client/themes/voyancetravail"
  "client/themes/voyancetravail/log"


)

