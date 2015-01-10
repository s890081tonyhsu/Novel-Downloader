#!/bin/bash
code=$(locale | grep "LANG" | sed 's/^.*\.//g')
if [ "$code" == "UTF-8" ]
then
	ruby ./bin/$1.rb $2 $3
else
	echo The code page is not what we need
fi
