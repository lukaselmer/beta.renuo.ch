#!/bin/bash

while true; do
  inotifywait -e attrib recompile.txt
  ./node_modules/docpad/bin/docpad generate --env static
  #s3cmd sync ./out/* s3://www.renuo.ch
done

