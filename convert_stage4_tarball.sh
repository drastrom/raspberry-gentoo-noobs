#!/bin/bash

STAGE4_BASENAME="`basename "$1" .xz`"
xzcat "$1" | wc -c > "`dirname "$1"`/$STAGE4_BASENAME.size"
