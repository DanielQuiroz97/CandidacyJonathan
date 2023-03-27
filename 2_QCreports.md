# Creating a MD5 checksum

# Quality control

## Creating directoryies
mkdir Raw Raw/MultiQC


## Running fastqc
apptainer exec 2_Software/fastqc.sif fastqc --threads 27 Question1/*fastq.gz --outdir=QC/Raw/

## Running MultiQC
apptainer exec 2_Software/MultiQC.sif multiqc QC/Raw/ --interactive -o QC/Raw/MultiQC 