
# Variant Calling

```
cd /fs/scratch/PAS1755/Jonathan/Daniel_Candidacy/Question1/Alignment

mkdir VC

for i in `cat ID`
do
   echo ../../2_Software/freebayes -f ../Reference/GDDH13_1-1_formatted.fasta.gz Read_group/$i\_sorted_rd.bam > VC/$i.vcf
done


```