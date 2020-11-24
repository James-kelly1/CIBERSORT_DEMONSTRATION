##Downloaded public RNA Count matrix example data from
##https://github.com/DadongZ/RNASeqDGE to demonstrate CIBERSORT

##Read in the data
library(readxl)
RAWRNA2 <- read_excel("/Users/jameskelly/Documents/CIBERDIR/example_rnaseq_count_matrix.xlsx")

##The gene names are the correct form for CIBERSORT but they need to be UPPERCASE
GENES <- c(RAWRNA2$Gene) ##Convert gene column to string.
GENES <- toupper(GENES) ##converted to upper case.
RAWRNA2$Gene <- GENES ##Replace existing column of gene names with this upper case one.

##Add RAWRNA2 file to the working directory which should also contain the 
##LM22 signature matrix and CIBERSORT Source code downloaded from
##https://cibersort.stanford.edu
write.table(RAWRNA2,"/Users/jameskelly/Documents/CIBERDIR/RAWRNA2.txt", sep = "\t")
setwd("/Users/jameskelly/Documents/CIBERDIR/")
install.packages("e1071")
BiocManager::install("preprocessCore")
source("CIBERSORT.R")
Immune_proportion <- CIBERSORT("LM22.txt", "RAWRNA2.txt", perm = 100, QN = TRUE)  