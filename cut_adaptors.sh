#!/bin/bash
for i in `cat ID`
do
    echo ./../2_Software/bbmap/bbduk.sh in1=Concatenated/$i\_merged_R1.fastq.gz in2=Concatenated/$i\_merged_R2.fastq.gz out1=Trimmed/$i\_merged_clean_R1.fastq.gz out2=Trimmed/$i\_merged_clean_R2.fastq.gz ref=adapters_illumina.fa k=23 mink=6 hdist=1 t=28 ktrim=r trimq=15 maq=15 qtrim=r minlen=50 tpe tbo overwrite=TRUE

done