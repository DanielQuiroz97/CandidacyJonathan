# SnpEff

## Peparind directories

```
cd /fs/scratch/PAS1755/Jonathan/Daniel_Candidacy/Question1/SnpEff


mkdir data data/Malus vcf
```

## Copy refernce files


```
# Reference genome
cp ../Reference/GDDH13_1-1_formatted.fasta Data/Malus/sequences.fa

# Proteins
cp ../Reference/GDDH13_1-1_prot.fasta Data/Malus/protein.fa

# Genes
cp ../../Question2/Reference/inra_clean.gff3 Data/Malus/genes.gff
```

## Building database

```
java -jar snpEff/snpEff.jar build -gff3 Malus -noCheckCds -noCheckProtein > build_out.txt
```


## Runing SnpEFF on SNP and Indels

```
mkdir Results

sinteractive -c 28 -t 00:59:00 -J snpeff -A PAS1755
module load java/12.0.2

# Annoating SNP
java -jar snpEff/snpEff.jar Malus vcf/merged_snp.vcf.gz > Results/snp_ann.vcf

# Anotating Indels 
java -jar snpEff/snpEff.jar Malus vcf/merged_indels.vcf > Results/indels_ann.vcf

```


