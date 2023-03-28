# Alignment

## Reference index
```
sinteractive -c 28 -t 00:30:00 -J index -A PAS1755

cd Refernce
bwa index GDDH13_1-1_formatted.fasta.gz

# Copy ID file
# Manually edited to remove C306
cp Trimmed/ID Alignment/

```


## Alignment

Schedulde in job composer

```
#!/bin/bash
#SBATCH -J ondemand/sys/myjobs/basic_sequential
#SBATCH --job-name bwa_alignment
#SBATCH --time=15:00:00
#SBATCH --ntasks=28
#SBATCH --exclusive
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --account=PAS1755 # Change account code accordingly

module load perl/5.26.1

#Change working directory
cd /fs/scratch/PAS1755/Jonathan/Daniel_Candidacy/Question1

for i in `cat Alignment/ID`
do
   ../2_Software/bwa/bwa mem -M -t 28 Reference/GDDH13_1-1_formatted.fasta.gz Trimmed/$i\_merged_clean_R1.fastq.gz Trimmed/$i\_merged_clean_R2.fastq.gz 2> Alignment/logs.txt > Alignment/$i.sam

done
```





