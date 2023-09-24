#!/bin/bash

function rebuild-python(){
    OLD_VERSION=$(python --version |awk '3 {print $2;}' | cut -d. -f1,2)
    pamac upgrade
    pamac build "$(pacman -Qoq /usr/lib/python3.11)"
    pamac upgrade --aur
    pip list --path "$HOME"/.local/lib/python"${OLD_VERSION}"/site-packages/ > .pip-lst.txt
    python3 Pip-update.py .pip-lst.txt
    tr '\n' '\0' < .pip-adj.txt | xargs -r -0 pip install -U
    rm -f .pip-lst.txt .pip-adj.txt
}

rebuild-python