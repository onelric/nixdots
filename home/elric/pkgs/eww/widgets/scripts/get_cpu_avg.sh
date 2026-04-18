#!/bin/sh
grep 'cpu ' /proc/stat | awk '{usage=int(($2+$4)*100/($2+$4+$5))} END {print usage "%"}'
