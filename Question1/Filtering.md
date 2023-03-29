# Filtering SNPs

```
mkdir Filtering Filtering/SNPs Filtering/Indels

# Creating IDs for the created VCF files
ls Alignment/VC/*.vcf | awk -F '/' '{print $3}' | awk -F '.' '{print $1}' | sort > Filtering/ID
```

```
#Ask for computing resources
sinteractive -c 28 -t 00:30:00 -J snps -A PAS1755 #Account
module load vcftools/0.1.16
```


# Indels 

## Extracting indels

```
for i in `cat Filtering/ID`
do
   vcftools --vcf Alignment/VC/$i.vcf --keep-only-indels --recode \
   --recode-INFO-all --out Filtering/Indels//$i\_indels_only
done
```


## Filtering

Filters applied

* Max number of missing data = 1
* Min Q score = 40
* Min depth coverage = 20
* Number alleles = 2 (Diploids)
* Min minor allele freq = 0.05

```
mkdir Filtering/Clean_indels

for i in  `cat Filtering/ID`
do
  vcftools --vcf Filtering/Indels/$i\_indels_only.recode.vcf --max-missing 1 --minQ 40 --minDP 20 --min-alleles 2 --max-alleles 2  --recode --recode-INFO-all --maf 0.05 --out Filtering/Clean_indels/$i\_indels_filtered

done
```



## Merging VCF


```
sinteractive -c 28 -t 00:30:00 -J Indels -A PAS1755 

module load htslib/1.6
module load bcftools/1.3.1

# Create ID of all vcf files
mkdir Merged_vcf vcf_gz



# ziping files to make compatible with bcftoosl

for i in `ls *.vcf`; do bgzip -c $i > vcf_gz/$i.gz; done;


cd vcf_gz

# Creating the tabix to preserve headers
for i in `ls *.vcf.gz`; do bcftools index $i; done;

ls *.vcf.gz > merge.txt

bcftools merge -l merge.txt -o ../Merged_vcf/merged_indels.vcf.gz
```

# SNPs

## Extrating SNPs

```
for i in `cat Filtering/ID_new`
do
   vcftools --vcf Alignment/VC/$i.vcf --remove-indels --recode \
   --recode-INFO-all --out Filtering/SNPs/$i\_snp
done

```

## Filtering

Filters applied

* Max number of missing data = 1
* Min Q score = 40
* Min depth coverage = 20
* Number alleles = 2 (Diploids)
* Min minor allele freq = 0.05

```
mkdir Filtering/Clean_snps
sinteractive -c 28 -t 00:59:00 -J filtering_snps -A PAS1755 #Account
module load vcftools/0.1.16

for i in `cat Filtering/ID`
do
  vcftools --vcf Filtering/SNPs/$i\_snp.recode.vcf --max-missing 1 --minQ 40  --minDP 20 --min-alleles 2 --max-alleles 2  --recode --recode-INFO-all --maf 0.05 --out Filtering/Clean_snps/$i\_snp_filtered

done
```

## Merging VCF


```
module load htslib/1.6
module load bcftools/1.3.1

# Create ID of all vcf files
cd Clean_snps
mkdir Merged_vcf vcf_gz



# ziping files to make compatible with bcftoosl

for i in `ls *.vcf`; do bgzip -c $i > vcf_gz/$i.gz; done;


cd vcf_gz

# Creating the tabix to preserve headers
for i in `ls *.vcf.gz`; do bcftools index $i; done;

ls *.vcf.gz > merge.txt

bcftools merge -l merge.txt -o ../Merged_vcf/merged_snp.vcf.gz
```
