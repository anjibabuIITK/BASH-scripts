#!/bin/bash
for i in `find . -name "*.*"` ; do
echo "$i"
diff -u $i ../plumed2-2.5.1-modified/$i >> modify.patch
done
#
#ater use this command to path
# patch -p 1 < modify.path

