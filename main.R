# Packages e Libraries
#install.packages("readr")
#install.packages("ggplot2")
#install.packages("corrplot")
library(readr)
library(plyr); #melhor rodar plyr antes de dplyr, por causa de conflitos
library(dplyr)
library(tidyr)
library(ggplot2)
library(sqldf)
library(reshape)
library(corrplot)
library(pander)
#coeficiente de variacao install.packages("raster")  library(raster)

# Leitura dos arquivos
  #arquivo com os dados csv
source("reader.R")
 
  #arquivo com o processamento dos dados
source("processor.R")

  #arquivo com os plots
source("plots.R")


