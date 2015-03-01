#!/bin/sh
# Generates a new Wand docset
cd docs
if [ -d _build ]; then
    rm -rf _build
fi
if [ -d Wand.docset ]; then
    rm -rf Wand.docset
fi
make html
cd ..
doc2dash -n Wand -i docs/_static/icon@2x.png -I index.html docs/_build/html
plutil -insert isJavaScriptEnabled -bool True Wand.docset/Contents/Info.plist
echo "New Wand docset located at $PWD/Wand.docset"
echo "Install it in the Dash app"
