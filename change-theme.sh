#!/bin/bash
read -p "Theme Name: "   config

python2 doom-theme-generator.py themes/$config custom
cp doom-custom-theme.el ~/.doom.d/themes
