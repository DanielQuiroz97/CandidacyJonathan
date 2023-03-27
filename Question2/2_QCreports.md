# Quality control
sinteractive -c 28 -t 00:20:00 -J QC_Q2 -A PAS1755
## Creating directoryies
cd Question2
mkdir QC QC/MultiQC


## Running fastqc
apptainer exec 2_Software/fastqc.sif fastqc --threads 27 Question2/1_Data/*fastq.gz --outdir=Question2/QC/

## Running MultiQC
apptainer exec 2_Software/MultiQC.sif multiqc Question2/QC/ --interactive -o Question2/QC/MultiQC 

