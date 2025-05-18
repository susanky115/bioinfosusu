#install.package("ggplot2")
# dplyr, tidyr, lubridate,
library(ggplot2)


myfiles = list.files("../zika/", pattern = "*\\d.txt", recursive = F, full.names = T)

for (m in myfiles) {
  print("m variable is:")
  print(m)
  d <- read.delim(m, header = T)
  name = gsub(".txt","", basename(m))
  names(d) = c("chrom", "pos", "depth")
  tile19 = round(mean(d[19305:20215, "depth"]), 2)

  p = ggplot(d, aes(x = pos, y = depth)) + 
    geom_col() +
    annotate("text", x = 1100, y = 5000, label = tile19) + 
    labs(title = "NL63 - Tile 19",subtitle = "Created by S.K Cheng")
  
  ggsave(paste0(name, ".pdf"), plot = p)
}
f 