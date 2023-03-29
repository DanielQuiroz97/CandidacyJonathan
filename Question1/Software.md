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


## Picard


```
module load picard/2.3.0
```


## Agat

```
# get the chosen AGAT container version
singularity pull docker://quay.io/biocontainers/agat:1.0.0--pl5321hdfd78af_0
# run the container
singularity run agat_1.0.0--pl5321hdfd78af_0.sif

```

## Trinity

```
wget -chttps://data.broadinstitute.org/Trinity/TRINITY_SINGULARITY/trinityrnaseq.v2.15.1.simg
```