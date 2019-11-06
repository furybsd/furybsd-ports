#!/bin/sh

cwd="`realpath | sed 's|/scripts||g'`"

${cwd}/lsports.sh | xargs ${cwd}/mkdist.sh
