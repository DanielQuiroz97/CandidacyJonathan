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
java -jar snpEff/snpEff.jar Malus vcf/merged_snp.vcf > Results/snp_ann.vcf

# Anotating Indels 
java -jar snpEff/snpEff.jar Malus vcf/merged_indels.vcf > Results/indels_ann.vcf

```

## Filtering snpEff vcf

### Indels

```
mkdir Filtering


cat indels_ann.vcf | grep -v "#" | grep "HIGH" | cut -f 1,2,8 | sed 's/|/\t/g' | grep -v "intergenic\|stream\|UTR" > Filtering/redundant_indels_table.txt


cd Filtering

cat redundant_indels_table.txt | cut -f 1,2,5,6 | uniq | sort > clean_indels_chromGene.txt


cat clean_indels_chromGene.txt | cut -f 4 | uniq > unique_indels_gene_list.txt
```

### SNP


```
cat snp_ann.vcf | grep -v "#" | grep "HIGH" | cut -f 1,2,8 | sed 's/|/\t/g' | grep -v "intergenic\|stream\|UTR" > Filtering/redundant_snp_table.txt


cd Filtering

cat redundant_snp_table.txt | cut -f 1,2,5,6 | uniq | sort > clean_snp_chromGene.txt


cat clean_snp_chromGene.txt | cut -f 4 | uniq > unique_snp_gene_list.txt
```

# Merging snp and indels


```
module load htslib/1.6

module load bcftools/1.3.1

bgzip -c merged_snp.vcf > merged_snp.vcf.gz
bgzip -c merged_indels.vcf > merged_indels.vcf.gz

bcftools index merged_indels.vcf.gz
bcftools index merged_snp.vcf.gz

bcftools merge  merged_indels.vcf.gz  merged_snp.vcf.gz -o merged_indels_snp.vcf.gz


```