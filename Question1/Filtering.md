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


# SNPs

## Extrating SNPs

```
for i in `cat Filtering/ID`
do
   vcftools --vcf Alignment/VC/$i.vcf --remove-indels --recode \
   --recode-INFO-all --out Filtering/SNPs/$i\_snp
done

```