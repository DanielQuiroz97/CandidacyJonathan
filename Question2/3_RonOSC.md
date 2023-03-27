# Preparing packages in R
```
cd $HOME
# Load R
module load R/4.2.1-gnu11.2
R

# Add bioconductor abd then the Rsubread, Rbowtie2, and edgeR packages:
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.15")

# You may get several question that may required you to write 'a' ir 'y', pay attention to the questions

# One of teh questions may be: "Warning in install.packages("BiocInstaller", repos = a["BioCsoft", "URL"]) :
 'lib = "/usr/local/R/intel/18.0/3.5.0/lib64/R/library"' is not writeable
Would you like to create a personal library instead? (y/n)" Just type y, and it will ask if ~/R/x86_64-unknown-linux-gnu-library/3.5 to install packages into? (y/n) and you just type y

# A long process of installation will start, once it is done and you see the R prompt, install the packages:
BiocManager::install("Rsubread")
BiocManager::install("Rbowtie2")
BiocManager::install("edgeR")

# Test whether the packages load:
library(Rsubread)
library(Rbowtie2)
library(edgeR)

# Once the installation and verification are done, quit R:
quit("no")
```