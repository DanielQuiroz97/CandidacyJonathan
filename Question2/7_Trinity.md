
# RNA de novo assembly with trinity

```

sinteractive -c 28 -t 04:00:00 -J Trinity -A PAS1755


cd /fs/scratch/PAS1755/Jonathan/Daniel_Candidacy/Question2/Trimmed

mkdir FS1_trinity FS2_trinity FS3_trinity SS1_trinity SS2_trinity SS2_trinity

apptainer exec ../../2_Software/trinityrnaseq.v2.15.1.simg Trinity \
  --seqType fq \
  --left Flesh_clean_S1_R1.fastq.gz \
  --right Flesh_clean_S1_R2.fastq.gz \
  --max_memory 80G --CPU 24 \
  --no_normalize_reads \
  --output FS1_trinity/
  
  apptainer exec ../../2_Software/trinityrnaseq.v2.15.1.simg Trinity \
  --seqType fq \
  --left Flesh_clean_S2_R1.fastq.gz \
  --right Flesh_clean_S2_R2.fastq.gz \
  --max_memory 80G --CPU 24 \
  --no_normalize_reads \
  --output FS2_trinity/
  
  apptainer exec ../../2_Software/trinityrnaseq.v2.15.1.simg Trinity \
  --seqType fq \
  --left Flesh_clean_S3_R1.fastq.gz \
  --right Flesh_clean_S3_R2.fastq.gz \
  --max_memory 80G --CPU 24 \
  --no_normalize_reads  \
  --output FS3_trinity/
  
  
  apptainer exec ../../2_Software/trinityrnaseq.v2.15.1.simg Trinity \
  --seqType fq \
  --left Skin_clean_S1_R1.fastq.gz \
  --right Skin_clean_S1_R2.fastq.gz \
  --max_memory 80G --CPU 24 \
  --no_normalize_reads \
  --output SS1_trinity/
  
  apptainer exec ../../2_Software/trinityrnaseq.v2.15.1.simg Trinity \
  --seqType fq \
  --left Skin_clean_S2_R1.fastq.gz \
  --right Skin_clean_S2_R2.fastq.gz \
  --max_memory 80G --CPU 24 \
  --no_normalize_reads \
  --output SS2_trinity/
  
  apptainer exec ../../2_Software/trinityrnaseq.v2.15.1.simg Trinity \
  --seqType fq \
  --left Skin_clean_S3_R1.fastq.gz \
  --right Skin_clean_S3_R2.fastq.gz \
  --max_memory 80G --CPU 24 \
  --no_normalize_reads  \
  --output SS3_trinity/
  
  
  
  