#!/bin/bash

STAGE4_BASENAME="`basename "$1" .bz2`"
bzcat "$1" | tee >(wc -c > "$STAGE4_BASENAME.size") | xz -zc -T 0 - > "$STAGE4_BASENAME.xz"
