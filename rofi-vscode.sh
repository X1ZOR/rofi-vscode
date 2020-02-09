#!/bin/sh

### Workspaces ###
pathToWorkspaces=$(echo "$1")

### Options ###
newWorkspace="Add new workspace"

chosen=$(echo "$(ls  $pathToWorkspaces)\nAdd new workspace" | rofi -dmenu -p "VSCode Workspace Selector > ")

### New Entry ###
newWorkspaceName=""

if [ "$chosen" = "$newWorkspace" ]
then
	newWorkspaceName=$(rofi -dmenu -p "Workspace Name: ")
	mkdir "$pathToWorkspaces$newWorkspaceName/"
else
	if [ "$chosen" = "" ]
	then
		exit 0
	else
		code "$pathToWorkspaces/$chosen/"
	fi
fi
