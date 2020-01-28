#!/usr/bin/env bash

if [ $(lsb_release --codename --short) = buster ]
then
  /scripts/install_arrow_deps_buster.sh
  Rscript /scripts/install_arrow.R
elif [ $(lsb_release --codename --short) = stretch ]
then
  /scripts/install_arrow_deps_stretch.sh
  Rscript /scripts/install_arrow.R  
else
  echo "Release doesn't provide Arrow dependencies. Skipping."
fi
