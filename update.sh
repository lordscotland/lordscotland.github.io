#!/bin/sh

{ for fn in packages/*; do
  ar p "$fn" control.tar.gz | tar xzO ./control
  echo Filename: "$fn"
  echo Size: $(stat -c%s "$fn")
  echo MD5sum: $(md5sum "$fn" | cut -d" " -f1)
  echo
done } | tee Packages
bzip2 -f Packages
