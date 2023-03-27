# Assesment of trimmed sequences


```
sinteractive -c 28 -t 00:30:00 -J assesment -A PAS1755
```

##Let's use MultiQC!
```
apptainer exec 2_Software/fastqc.sif fastqc --threads 27 Question1/Trimmed/*fastq.gz --outdir=QC/Trimmed
```
##Let's use MultiQC!

```
apptainer exec 2_Software/MultiQC.sif multiqc QC/Trimmed/ --interactive -o QC/Trimmed/MultiQC 
```