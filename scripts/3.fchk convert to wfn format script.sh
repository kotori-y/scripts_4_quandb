#!/bin/bash
icc=0
nfile=`ls *.fchk|wc -l`
for inf in *.fchk
do
((icc++))
echo Converting ${inf} to ${inf//fchk/wfn} ... \($icc of $nfile\)
./Multiwfn ${inf} << EOF > /dev/null
100
2
5
/home/wll/YZJ/Multiwfn_3.8/${inf//fchk/wfn}
0
q
EOF
done
