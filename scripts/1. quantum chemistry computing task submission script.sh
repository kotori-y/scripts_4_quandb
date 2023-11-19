#!/bin/bash
#PBS -l nodes=1:ppn=72
#PBS -o out.txt
#PBS -j oe
#PBS -p 1000
#PBS -q workq

g16root=/share/apps
export GAUSS_SCRDIR=/home/wangliangliang/WLL/tmp
. $g16root/g16_B01/bsd/g16.profile

cd $PBS_O_WORKDIR
NP='cat $PBS_NODEFILE|wc -l'

icc=0
nfile=`ls ./*.gjf|wc -l`
for inf in *.gjf
do
((icc++))
echo Running ${inf} ... \($icc of $nfile\)
time g16 < ${inf} > ${inf//gjf/out}
echo ${inf} has finished
echo
done


