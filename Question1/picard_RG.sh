#!/bin/bash

module load picard/2.3.0
cd /fs/scratch/PAS1755/Jonathan/Daniel_Candidacy/Question1/Alignment
mkdir Read_group

# Read groups
for i in `cat ID`
do
    java -Xmx160000m -jar $PICARD AddOrReplaceReadGroups I=no_duplicates/$i\_sorted.sam O=Read_group/$i\_sorted_rd.bam SORT_ORDER=coordinate RGID=$i\-id RGLB=$i\-lib RGPL=ILLUMINA RGPU=$i\-01 RGSM=$i

done