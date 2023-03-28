#!/bin/bash

Flesh_Sample1_R1.fastq.gz  Flesh_Sample2_R1.fastq.gz  Flesh_Sample3_R1.fastq.gz  Skin_Sample1_R1.fastq.gz  Skin_Sample2_R1.fastq.gz  Skin_Sample3_R1.fastq.gz
Flesh_Sample1_R2.fastq.gz  Flesh_Sample2_R2.fastq.gz  Flesh_Sample3_R2.fastq.gz  Skin_Sample1_R2.fastq.gz  Skin_Sample2_R2.fastq.gz  Skin_Sample3_R2.fastq.gz

```
# Flesh
../2_Software/bbmap/bbduk.sh in1=1_Data/Flesh_Sample1_R1.fastq.gz  in2=1_Data/Flesh_Sample1_R2.fastq.gz out1=Trimmed/Flesh_clean_S1_R1.fastq.gz out2=Trimmed/Flesh_clean_S1_R2.fastq.gz ref=adaptors.fa k=23 mink=6 hdist=1 t=28 ktrim=r trimq=15 maq=15 qtrim=r minlen=50 tpe tbo overwrite=TRUE


../2_Software/bbmap/bbduk.sh in1=1_Data/Flesh_Sample2_R1.fastq.gz  in2=1_Data/Flesh_Sample2_R2.fastq.gz out1=Trimmed/Flesh_clean_S2_R1.fastq.gz out2=Trimmed/Flesh_clean_S2_R2.fastq.gz ref=adaptors.fa k=23 mink=6 hdist=1 t=28 ktrim=r trimq=15 maq=15 qtrim=r minlen=50 tpe tbo overwrite=TRUE

../2_Software/bbmap/bbduk.sh in1=1_Data/Flesh_Sample3_R1.fastq.gz  in2=1_Data/Flesh_Sample3_R2.fastq.gz out1=Trimmed/Flesh_clean_S3_R1.fastq.gz out2=Trimmed/Flesh_clean_S3_R2.fastq.gz ref=adaptors.fa k=23 mink=6 hdist=1 t=28 ktrim=r trimq=15 maq=15 qtrim=r minlen=50 tpe tbo overwrite=TRUE

# Skin
../2_Software/bbmap/bbduk.sh in1=1_Data/Skin_Sample1_R1.fastq.gz  in2=1_Data/Skin_Sample1_R2.fastq.gz out1=Trimmed/Skin_clean_S1_R1.fastq.gz out2=Trimmed/Skin_clean_S1_R2.fastq.gz ref=adaptors.fa k=23 mink=6 hdist=1 t=28 ktrim=r trimq=15 maq=15 qtrim=r minlen=50 tpe tbo overwrite=TRUE


../2_Software/bbmap/bbduk.sh in1=1_Data/Skin_Sample2_R1.fastq.gz  in2=1_Data/Skin_Sample2_R2.fastq.gz out1=Trimmed/Skin_clean_S2_R1.fastq.gz out2=Trimmed/Skin_clean_S2_R2.fastq.gz ref=adaptors.fa k=23 mink=6 hdist=1 t=28 ktrim=r trimq=15 maq=15 qtrim=r minlen=50 tpe tbo overwrite=TRUE

../2_Software/bbmap/bbduk.sh in1=1_Data/Skin_Sample3_R1.fastq.gz  in2=1_Data/Skin_Sample3_R2.fastq.gz out1=Trimmed/Skin_clean_S3_R1.fastq.gz out2=Trimmed/Skin_clean_S3_R2.fastq.gz ref=adaptors.fa k=23 mink=6 hdist=1 t=28 ktrim=r trimq=15 maq=15 qtrim=r minlen=50 tpe tbo overwrite=TRUE

```