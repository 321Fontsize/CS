#!/bin/bash

# Function to save the current working directory
marco() {
    export MARCO_DIR=$(pwd)
    echo "Current directory saved. Use 'polo' to return to this directory."
}

# Function to return to the directory saved by marco
polo() {
    if [ -n "$MARCO_DIR" ]; then
        cd "$MARCO_DIR" || return
        echo "Returned to directory: $MARCO_DIR"
    else
        echo "Use 'marco' first to save the current directory."
    fi
}
