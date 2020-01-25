#Ternary Plots

#Reference website code
https://www.jstatsoft.org/index.php/jss/article/view/v087c03/v87c03.pdf
https://xang1234.github.io/ternary/
https://www.r-bloggers.com/using-r-to-create-ternary-diagrams-an-example-using-2016-presidential-polling-data/
  
#Set working directory
  setwd("C:/Users/Jason/Desktop/Yates Project/Osa/Osa's BIOM FILES")

#Load Packages
library(Ternary)
library(ggtern) #Make sure you have ggplot2 installed before loading ggtern. Loading ggtern will automatically load ggplot2
library(viridis)

#Import Data frame----------------------------------------------------------------------------------

#Treatment 1
Fungi_mc2_T1 <- read.delim("C:/Users/Jason/Desktop/Yates Project/Osa/Osa's BIOM FILES/fungi_otu_mc2_Treatment_1_df.txt")

#Plot----------------------------------------------------------------------------------------
ggtern(Fungi_mc2_T1, aes(x = BK, y = Rh, z = Rp)) +
  geom_point(aes(fill = Phylum, size = Count_Sum),shape = 21, alpha = 0.5, stroke = 0.5) +
  ggtitle("Fungi_mc2 - Treatment 1") +
  scale_fill_viridis(discrete=TRUE) +
  theme_rgbw() +
  scale_size(range = c(1, 30), name="Average Counts") +
  theme(legend.position = c(0,1), legend.justification = c(1, 1))+
  theme(plot.title = element_text(size=30, hjust = 0.5, family = "Tahoma", face = "bold"), 
        axis.text = element_text(size=20, family = "Tahoma"), 
        axis.title = element_text(size=30, family = "Tahoma", face = "bold"))


#Final Publication ready plot------------------------------------------------------------------------------

tiff("Fungi_mc2-T1.tiff", width = 12, height = 8, units = 'in', res = 300, compression = "lzw")  

ggtern(Fungi_mc2_T1, aes(x = BK, y = Rh, z = Rp)) +
  geom_point(aes(fill = Phylum, size = Count_Sum),shape = 21, alpha = 0.5, stroke = 0.5) +
  ggtitle("Fungi_mc2 - Treatment 1") +
  scale_fill_viridis(discrete=TRUE) +
  theme_rgbw() +
  scale_size(range = c(1, 30), name="Average Counts") +
  theme(legend.position = c(0,1), legend.justification = c(1, 1))+
  theme(plot.title = element_text(size=30, hjust = 0.5, family = "Tahoma", face = "bold"), 
        axis.text = element_text(size=20, family = "Tahoma"), 
        axis.title = element_text(size=30, family = "Tahoma", face = "bold"))

dev.off()

