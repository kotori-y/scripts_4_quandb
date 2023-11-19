#!/bin/bash
icc=0
nfile=`ls *.wfn|wc -l`
for inf in *.wfn
do
((icc++))
echo Running ${inf} ... \($icc of $nfile\)
./Multiwfn ${inf} << EOF > ${inf//wfn/txt}
12
3
0.20
0
-1
-1
q
EOF
done
