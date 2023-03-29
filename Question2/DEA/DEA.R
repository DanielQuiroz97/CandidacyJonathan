# Then start the analysis:
library(edgeR)
library(tidyverse)

exp <- read.delim("../Alignment/SkinFleshCounts.txt", header=TRUE, row.names="GeneID") %>% 
  dplyr::select(-Length)

treatment <- c("Flesh", "Flesh", "Flesh", "Skin", "Skin", "Skin")

rcgrp <- factor(treatment)
y <- DGEList(counts = exp, group = rcgrp)
y$samples

design <- model.matrix(~rcgrp)
y <- estimateGLMCommonDisp(y,design)
y <- estimateGLMTrendedDisp(y,design)
y <- estimateGLMTagwiseDisp(y,design)

TestDE <- exactTest(y, pair = c("Skin", "Flesh"))
plotMD(TestDE, adjust.method = "BH", p.value = 0.001)
topTags(TestDE)

deTestDE <- decideTestsDGE(TestDE, adjust.method = "BH", p.value = 0.001)
summary(deTestDE)

table_TestDE <- topTags(TestDE, n=8552)
write.csv(table_TestDE, "DE_Flesh_Skin_p001.csv")

# Count analysis

count_type <- exp %>% mutate(Genes = rownames(.)) %>%
  pivot_longer(cols = Flesh_S1.bam:Skin_S3.bam,
                     names_to = "Type", values_to = "Counts") %>% 
  mutate(Type = str_remove(Type, pattern = "_S[1-3].bam")) %>% 
  group_by(Genes, Type) %>% summarise(Total = sum(Counts)) %>% 
  mutate(Depth = case_when(Total < 20 ~ "Low",
                            Total >= 20 & Total < 40 ~ "Medioum",
                            Total >= 40 ~ "High"))
  
write.csv(count_type, file = "Count_type.csv")

count_type %>% ungroup %>% group_by(Type, Depth) %>% count() %>% 
  ggplot(aes(Depth, n, fill = Type)) + geom_col(position = "dodge") + coord_flip() +
  theme_classic() + ggsci::scale_fill_aaas(alpha = 0.7) + 
  labs(fill = "Apple matrix", y = "Gene counts", x = "Sequencing depth")
