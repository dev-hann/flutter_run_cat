#!/bin/bash


echo "Start Update..."
APP_NAME="flutter_run_cat"

RELEASE="https://github.com/yoehwan/flutter_run_cat/releases/download/v1.0.0/"

RELEASE_NAME="Run.Cat.v1.0.0.x64.linux.tar.xz"

OUTPUT="$HOME/flutter_run_cat"


# ShutDown app
pkill $APP_NAME

download()
{
if [ -x "$(which wget)" ] ; then
	echo "download wget."
	wget $RELEASE$RELEASE_NAME
elif [ -x "$(which curl)" ] ; then
	echo "download curl."
else 
	echo "Could not find curl or wget, please install one."
fi
}

unzip()
{

mkdir -p $OUTPUT

tar -xf $RELEASE_NAME -C "$OUTPUT"

}

addPath()
{
	
	VAR="FLUTTER_RUN_CAT"
	EXPORT="export $VAR=\"$OUTPUT\""
	BASHRC="$HOME/.bashrc"

	if ! grep -q "$EXPORT" "$BASHRC" ; then
		echo "# RunCat" >> "$BASHRC"
		echo "$EXPORT" >> "$BASHRC"
		echo "export PATH=\$PATH:\$$VAR" >> "$BASHRC"
	fi
	
}


runApp()
{
	$OUTPUT/$APP_NAME &
}

download

unzip

addPath

runApp
