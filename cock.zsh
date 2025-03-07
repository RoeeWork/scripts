# This program is used to automate gcc output.
# It is the equivilent of the command "gcc filename || ./a.out".
# For convinient use, add an alias to this scrip in the ".zhrc" file.

#! /usr/bin/zsh
# Check if the user added the file name parameter.
if [ -z $1 ]; then
	echo "EXIT CODE 2 ERROR: please input the files name.\ncock [filename]"
	exit 2
fi

# Use gcc with the first parameter, which is the file name.
$(gcc $1 -std=c89 -Wall -Wextra) # added "-std=c89" so gcc compiles in c89.

# Check if gcc returned no errors (exit value 0), if true open ./a.out.
# If there are any errors gcc will either way output them to the terminal,
if [ $? -eq 0 ]; then
	./a.out
	exit 0
fi

