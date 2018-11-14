#!/bin/sh

source ./deploy/config.sh

if [ $CLONE ]; then
  if [ $TO = 'preprod' ]; then
    rm -rf $TARGET;
  fi
fi

##deploiement
if [ ! -d $TARGET ]; then
  source ./deploy/clone.sh
else
  cd $TARGET
  git pull origin $BRANCH
fi

## Creation des repertoires pouvant manquer
for dir in ${DIRS[*]}
do
  FILE="${TARGET}/${dir}"
  if [ ! -d $FILE ]; then
   mkdir $FILE;
  echo "creating dir ${FILE}";
  fi
  
done

