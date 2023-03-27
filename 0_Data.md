# Concatenating data

```
sinteractive -c 28 -t 00:30:00 -J Concatenating -A PAS1755
```
```
# Create a list of unique sample IDs
ls -1 *R1*.gz | awk -F '_' '{print $1}' | sort | uniq > ID

# view sample ID
cat ID

# R1 reads

for i in `cat ./ID`; do echo cat $i\_L001_R1_001.fastq.gz $i\_L002_R1_001.fastq.gz  \> Concatenated/$i\_merged_R1.fastq.gz ; done
```




```
## R2 reads
for i in `cat ./ID`; do echo cat $i\_L001_R2_001.fastq.gz $i\_L002_R2_001.fastq.gz  \> Concatenated/$i\_merged_R2.fastq.gz; done

```

# Verify if reads are paired

```
cd path/to/Final_Project/3_Software/bbmap/reformat.sh in1=A39_merged_R1.fastq.gz in2=A39_merged_R2.fastq.gz verifypairing

No output stream specified.  To write to stdout, please specify 'out=stdout.fq' or similar.
Set INTERLEAVED to false
Input is being processed as paired
Input:                          103517182 reads                 14086852378 bases
Output:                         103517182 reads (100.00%)       14086852378 bases (100.00%)

Time:                           87.926 seconds.
Reads Processed:        103m    1177.32k reads/sec
Bases Processed:      14086m    160.21m bases/sec
Names appear to be correctly paired.

```

> Samples are paired correctly

# Trimming

>Adaptor Read1   AGATCGGAAGAGCACACGTCTGAACTCCAGTCA
 Adaptor Read2   AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT

```
mkdir Trimmed

cd /path/to/Final_Project/1_Raw_Data/Concatenated
ls -1 *R1*.gz | awk -F '_' '{print $1}' | sort | uniq > ID

cp ID /path/to/Final_Project/Processing/trimming/
cd /path/to/Final_Project/Processing/trimming
```


## Cut adaptros loop

```
#!/bin/bash
for i in `cat ID`
do
    echo ./../2_Software/bbmap/bbduk.sh in1=Concatenated/$i\_merged_R1.fastq.gz in2=Concatenated/$i\_merged_R2.fastq.gz out1=Trimmed/$i\_merged_clean_R1.fastq.gz out2=Trimmed/$i\_merged_clean_R2.fastq.gz ref=adapters_illumina.fa k=23 mink=6 hdist=1 t=28 ktrim=r trimq=15 maq=15 qtrim=r minlen=50 tpe tbo overwrite=TRUE

done
```

## Running as a batch job

```
cd Trimmed
sinteractive -c 28 -t 00:30:00 -J Cut_adapters -A PAS2303
bash cut_adapters.sh
```


