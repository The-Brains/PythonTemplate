#!/bin/bash

if (( $# != 6 )); then
	echo "You need a <DESTINATIONPATH> <PROJECTNAME> <YOURNAME> <YOUREMAIL> '<PROJECTDESCRIPTION>' '<PROJECTSHORTDESCRIPTION>'"
	exit 1
fi

function confirmation() {
  echo -n "Continue? (y/n) "
  read confirmation
  if [[ $confirmation == "y" ]]; then
  	return 0
  else
  	return 1
  fi
}

DESTINATION_PATH=$1

echo "Copy template to $DESTINATION_PATH"
if ! confirmation ; then
	echo "ok"
	exit 1
fi

mkdir -p $DESTINATION_PATH
cp -r $PYTHON_TEMPLATE_FOLDER $DESTINATION_PATH

echo "Replace All"
if ! confirmation ; then
	echo "ok"
	exit 1
fi

function replace() {
	REGEX="s/$1/$2/g"
	find "$DESTINATION_PATH/<PROJECTNAME>Repo" -type f -exec sed -i '' "$REGEX" {} +
}

PROJECT_NAME=$2
replace "\<PROJECTNAME\>" "$PROJECT_NAME"

YOUR_NAME=$3
replace "\<YOURNAME\>" "$YOUR_NAME"

YOUR_EMAIL=$4
replace "\<YOUREMAIL\>" "$YOUR_EMAIL"

PROJECT_DESCRIPTION=$5
replace "\<PROJECTDESCRIPTION\>" "$PROJECT_DESCRIPTION"

PROJECT_SHORT_DESCRIPTION=$6
replace "\<PROJECTSHORTDESCRIPTION\>" "$PROJECT_SHORT_DESCRIPTION"


CURRENT_YEAR=$(date +%Y)
replace "\<CURRENTYEAR\>" "$CURRENT_YEAR"

rm -fr "$DESTINATION_PATH/${PROJECT_NAME}Repo"
mv "$DESTINATION_PATH/<PROJECTNAME>Repo/<PROJECTNAME>" "$DESTINATION_PATH/<PROJECTNAME>Repo/$PROJECT_NAME"
mv "$DESTINATION_PATH/<PROJECTNAME>Repo" "$DESTINATION_PATH/${PROJECT_NAME}Repo"

echo "DONE"
echo "cd ${DESTINATION_PATH}/${PROJECT_NAME}Repo/"
