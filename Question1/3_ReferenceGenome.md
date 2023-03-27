# Dowloading reference genome

From the GDR website [link](https://www.rosaceae.org/analysis/242)

## Genome assembly
```
mkdir Reference
cd Refernce

wget -c https://www.rosaceae.org/rosaceae_downloads/Malus_x_domestica/Malus_x_domestica-genome_GDDH13_v1.1/assembly/GDDH13_1-1_formatted.fasta.gz
```

## Gene prediction

```
wget -c https://www.rosaceae.org/rosaceae_downloads/Malus_x_domestica/Malus_x_domestica-genome_GDDH13_v1.1/genes/GDDH13_1-1_mrna.fasta.gz

wget -c https://www.rosaceae.org/rosaceae_downloads/Malus_x_domestica/Malus_x_domestica-genome_GDDH13_v1.1/genes/GDDH13_1-1_prot.fasta.gz

wget -c https://www.rosaceae.org/rosaceae_downloads/Malus_x_domestica/Malus_x_domestica-genome_GDDH13_v1.1/genes/gene_models_20170612.gff3.gz
```