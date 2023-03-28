# Software installation

## FASTQC
```
apptainer pull fastqc.sif docker://quay.io/biocontainers/fastqc:0.11.9--hdfd78af_1
```

## MultiQC
```
apptainer pull MultiQC.sif docker://quay.io/biocontainers/multiqc:1.13--pyhdfd78af_0
```
## BBtools
```
wget https://sourceforge.net/projects/bbmap/files/BBMap_39.00.tar.gz
tar -xvzf BBMap_39.00.tar.gz
rm BBMap_39.00.tar.gz
# Does BBTools work?
/path/to/Final_Project/3_Software/bbmap/bbmerge.sh
```
## BWA

```
cd path/to/Final_Project/3_Software
git clone https://github.com/lh3/bwa.git
cd bwa
make
export PATH=$PATH:export PATH=$PATH:/fs/scratch/PAS1755/Jonathan/Daniel_Candidacy/2_Software/bwa
source ~/.bashrc #Refresh the current shell environment
# Does BWA run?
bwa
```

## Freebayes

```
wget https://github.com/freebayes/freebayes/releases/download/v1.3.6/freebayes-1.3.6-linux-amd64-static.gz
chmod 777 freebayes-1.3.6-linux-amd64-static.gz

```