#!/bin/sh
# Generates a new Wand docset for Dash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[1;33m'
nc='\033[0m'

if [ -d Wand.docset ]; then
    echo "${yellow}Existing docset found. Backing up with .old suffix${nc}"
    mv Wand.docset Wand.docset.old
fi
cd docs
if [ -d _build ]; then
    echo "${yellow}Removing html _build directory${nc}"
    rm -rf _build
fi
if make html; then
    cd ..
    if doc2dash -n Wand -i docs/_static/icon@2x.png -I index.html docs/_build/html; then
        if plutil -insert isJavaScriptEnabled -bool True Wand.docset/Contents/Info.plist; then
            echo "${yellow}Docset created successfully. Removing old backup${nc}"
            rm -rf Wand.docset.old
            echo "${green}Do you wish to install the new docset in Dash now (remove old docset from Dash first)?${nc}"
            while true; do
                read -p "Yes/No (y/n): " choice
                case $choice in
                    y|Y)
                    echo "${green}Done! Opening docset in Dash${nc}"
                    open Wand.docset
                    break;;
                    n|N)
                    echo "${green}Done! New Wand docset located at $PWD/Wand.docset${nc}"
                    echo "${green}You can install it later in the Dash app preferences${nc}"
                    break;;
                    *)
                    echo "Not a valid choice (must be y / n)"
                    ;;
                esac
            done
        fi
    fi
else
    cd ..
    mv Wand.docset.old Wand.docset
    echo "${red}Something went wrong${nc}"
    echo "${red}Old docset, if previously available, remains in $PWD/Wand.docset${nc}"
fi
