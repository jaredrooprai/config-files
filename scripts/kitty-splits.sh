#!/usr/bin/env zsh

# Kitty Terminal Split Pane Functions
# This file contains functions to create and manage split panes in Kitty terminal

# Usage
# source "${HOME}/code/config-files/scripts/kitty-splits.sh"
# vsplit


# Function to create a vertical split (splits right)
vsplit() {
    local cmd=${1:-$SHELL}
    kitty @ launch --type=window --location=vsplit ${2:+--keep-focus} "$cmd"
}

# Function to create a horizontal split (splits below)
hsplit() {
    local cmd=${1:-$SHELL}
    kitty @ launch --type=window --location=hsplit ${2:+--keep-focus} "$cmd"
}

# Function to rename the current kitty tab
rename_tab() {
    if [ -z "$1" ]; then
        echo "Usage: rename_tab <new_tab_name>"
        return 1
    fi
    kitty @ set-tab-title "$1"
}

# Function to create a vertical split and run a command
vsplit_cmd() {
    if [ -z "$1" ]; then
        echo "Usage: vsplit_cmd <command>"
        return 1
    fi
    vsplit "$1"
}

# Function to create a horizontal split and run a command
hsplit_cmd() {
    if [ -z "$1" ]; then
        echo "Usage: hsplit_cmd <command>"
        return 1
    fi
    hsplit "$1"
}