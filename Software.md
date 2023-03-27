# Software installation

## FASTQC
apptainer pull fastqc.sif docker://quay.io/biocontainers/fastqc:0.11.9--hdfd78af_1


## MultiQC

apptainer pull MultiQC.sif docker://quay.io/biocontainers/multiqc:1.13--pyhdfd78af_0

## BBtools

wget https://sourceforge.net/projects/bbmap/files/BBMap_39.00.tar.gz
tar -xvzf BBMap_39.00.tar.gz
rm BBMap_39.00.tar.gz
# Does BBTools work?
/path/to/Final_Project/3_Software/bbmap/bbmerge.sh