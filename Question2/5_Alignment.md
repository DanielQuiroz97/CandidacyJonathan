# Indexing

```
sinteractive -c 28 -t 00:20:00 -J Indexing -A PAS1755
cd /fs/scratch/PAS1755/Jonathan/Daniel_Candidacy/Question2/Reference


# Execute R Interactively:
module load R/4.2.1-gnu11.2
R
library(Rsubread)
buildindex(basename = "Malus_Index", reference = "GDDH13_1-1_formatted.fasta.gz")

quit("no")

```


# Alignment

```

# Flesh S1
align(index="Reference/Malus_Index",readfile1="1_Data/Flesh_Sample1_R1.fastq.gz",readfile2="1_Data/Flesh_Sample1_R2.fastq.gz",input_format="FASTQ",output_format="BAM",output_file="Flesh_S1.bam",nsubreads=14,maxMismatches=5,nthreads=24,phredOffset=33,unique=TRUE,minFragLength=50,maxFragLength=200,PE_orientation="fr",nTrim5=0,nTrim3=0,readGroupID=NULL,readGroup=NULL,color2base=FALSE,DP_GapOpenPenalty=-1, DP_GapExtPenalty=0,DP_MismatchPenalty=0,DP_MatchScore=2)

# Flesh S2
align(index="Reference/Malus_Index",readfile1="1_Data/Flesh_Sample2_R1.fastq.gz",readfile2="1_Data/Flesh_Sample2_R2.fastq.gz",input_format="FASTQ",output_format="BAM",output_file="Flesh_S2.bam",nsubreads=14,maxMismatches=5,nthreads=24,phredOffset=33,unique=TRUE,minFragLength=50,maxFragLength=200,PE_orientation="fr",nTrim5=0,nTrim3=0,readGroupID=NULL,readGroup=NULL,color2base=FALSE,DP_GapOpenPenalty=-1, DP_GapExtPenalty=0,DP_MismatchPenalty=0,DP_MatchScore=2)

# Flesh S3
align(index="Reference/Malus_Index",readfile1="1_Data/Flesh_Sample3_R1.fastq.gz",readfile2="1_Data/Flesh_Sample3_R2.fastq.gz",input_format="FASTQ",output_format="BAM",output_file="Flesh_S3.bam",nsubreads=14,maxMismatches=5,nthreads=24,phredOffset=33,unique=TRUE,minFragLength=50,maxFragLength=200,PE_orientation="fr",nTrim5=0,nTrim3=0,readGroupID=NULL,readGroup=NULL,color2base=FALSE,DP_GapOpenPenalty=-1, DP_GapExtPenalty=0,DP_MismatchPenalty=0,DP_MatchScore=2)

# Skin S1
align(index="Reference/Malus_Index",readfile1="1_Data/Skin_Sample1_R1.fastq.gz",readfile2="1_Data/Skin_Sample1_R2.fastq.gz",input_format="FASTQ",output_format="BAM",output_file="Skin_S1.bam",nsubreads=14,maxMismatches=5,nthreads=24,phredOffset=33,unique=TRUE,minFragLength=50,maxFragLength=200,PE_orientation="fr",nTrim5=0,nTrim3=0,readGroupID=NULL,readGroup=NULL,color2base=FALSE,DP_GapOpenPenalty=-1, DP_GapExtPenalty=0,DP_MismatchPenalty=0,DP_MatchScore=2)

# Skin S2
align(index="Reference/Malus_Index",readfile1="1_Data/Skin_Sample2_R1.fastq.gz",readfile2="1_Data/Skin_Sample2_R2.fastq.gz",input_format="FASTQ",output_format="BAM",output_file="Skin_S2.bam",nsubreads=14,maxMismatches=5,nthreads=24,phredOffset=33,unique=TRUE,minFragLength=50,maxFragLength=200,PE_orientation="fr",nTrim5=0,nTrim3=0,readGroupID=NULL,readGroup=NULL,color2base=FALSE,DP_GapOpenPenalty=-1, DP_GapExtPenalty=0,DP_MismatchPenalty=0,DP_MatchScore=2)

# Skin S3
align(index="Reference/Malus_Index",readfile1="1_Data/Skin_Sample3_R1.fastq.gz",readfile2="1_Data/Skin_Sample3_R2.fastq.gz",input_format="FASTQ",output_format="BAM",output_file="Skin_S3.bam",nsubreads=14,maxMismatches=5,nthreads=24,phredOffset=33,unique=TRUE,minFragLength=50,maxFragLength=200,PE_orientation="fr",nTrim5=0,nTrim3=0,readGroupID=NULL,readGroup=NULL,color2base=FALSE,DP_GapOpenPenalty=-1, DP_GapExtPenalty=0,DP_MismatchPenalty=0,DP_MatchScore=2)
```


## Fixing gff3

```
grep 'ID= ""' genes.gff3
grep -v 'ID= ""'genes.gff3 > genes_fixed.gff3
```

```
# Feature count
fc <- featureCounts(files=c("Flesh_S1.bam","Flesh_S2.bam","Flesh_S3.bam","Skin_S1.bam","Skin_S2.bam","Skin_S3.bam"),annot.ext="Reference/gene_moels_20170612.gff3",isGTFAnnotationFile=TRUE,GTF.featureType="gene",GTF.attrType="ID",useMetaFeatures=TRUE,countMultiMappingReads=TRUE,fraction=TRUE,genome="Reference/GDDH13_1-1_formatted.fasta.gz",isPairedEnd=TRUE,autosort=TRUE,nthreads=26)
```

