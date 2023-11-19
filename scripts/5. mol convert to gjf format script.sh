#!/bin/bash
icc=0
nfile=`ls *.mol|wc -l`
for inf in *.mol
do
((icc++))
echo Converting ${inf} to ${inf//mol/gjf} ... \($icc of $nfile\)
./Multiwfn ${inf} << EOF > /dev/null
100
2
10
${inf//mol/gjf}
n
0
q
EOF
done

