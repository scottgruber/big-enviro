
###############################
#
#     Tutorial 4 code
#     Created by Alan Barreca
#     April 2020
#
###############################


###############
# LOAD PACKAGES
###############

library(ggplot2)
library(dplyr)
library(readr)

###############
# IMPORT DATA
###############

ghcn_lax_1968 <- read_csv("~/Documents/big-enviro/data/ghcn/ghcn_lax_1968.csv", col_types = cols(date = col_date(format = "%Y-%m-%d")))
ghcn_lax_1968_2019 <- ghcn_lax_1968

for (year in 1969:2019){
  
  #TEMPORARY NAMES
  tempname <- paste0("ghcn_lax_", year)
  csvname <- paste0("~/Documents/big-enviro/data/ghcn/ghcn_lax_", year, ".csv")

  #IMPORT
  tempdata <- read_csv(csvname, col_types = cols(date = col_date(format = "%Y-%m-%d")))
  
  #BIND DATA TOGETHER
  ghcn_lax_1968_2019 <- bind_rows(ghcn_lax_1968_2019, tempdata)
  
  #RENAME
  assign(tempname, tempdata)

} 

rm(tempdata, csvname, tempname, year)

#Save data
write.csv(ghcn_lax_1968_2019, "~/Documents/big-enviro/data/ghcn/ghcn_lax_1968_2019.csv")

#################
#       GRAPHS
#################

ggplot(ghcn_lax_1968_2019, aes(y=tmax, x=date)) + 
  geom_point() +
  labs(y = "Max temperature", x = "") +
  scale_x_date(date_breaks = "5 years", date_labels = "%Y") + 
  theme(panel.background = element_rect(fill="white"))

ggsave("~/Documents/big-enviro/output/tutorials/scat_tmax_date_lax_1968_2019.pdf")



