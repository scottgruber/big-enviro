library(ggplot2)
library(dplyr)
library(readr)
ghcn_lax_2019 <- read_csv("data/ghcn/ghcn_lax_2019.csv")
ghcn_lax_2018 <- read_csv("data/ghcn/ghcn_lax_2018.csv")
ghcn_lax_2017 <- read_csv("data/ghcn/ghcn_lax_2017.csv")
ghcn_lax_2016 <- read_csv("data/ghcn/ghcn_lax_2016.csv")
ghcn_lax_2015 <- read_csv("data/ghcn/ghcn_lax_2015.csv")
ghcn_lax_2014 <- read_csv("data/ghcn/ghcn_lax_2014.csv")
ghcn_lax_2013 <- read_csv("data/ghcn/ghcn_lax_2013.csv")
ghcn_lax_2012 <- read_csv("data/ghcn/ghcn_lax_2012.csv")
ghcn_lax_2011 <- read_csv("data/ghcn/ghcn_lax_2011.csv")
ghcn_lax_2010 <- read_csv("data/ghcn/ghcn_lax_2010.csv")

# bind all ten years of data into new variable
ghcn_lax_2010_2019 <- bind_rows(ghcn_lax_2010, ghcn_lax_2011, ghcn_lax_2012, ghcn_lax_2013, ghcn_lax_2014, ghcn_lax_2015, ghcn_lax_2016, ghcn_lax_2017, ghcn_lax_2018, ghcn_lax_2019)

# save new csv of ten years of data
write_csv(ghcn_lax_2010_2019, "data/ghcn/ghcn_lax_2010_2019.csv")


ggplot(ghcn_lax_2010_2019, aes(y=tmax, x=date)) + 
  geom_point(colour="#83b500") +
  labs(y="Max temperature", x="") +
  scale_x_date(date_breaks = "2 years", date_labels = "%Y") +
  theme(panel.background= element_rect(fill="#333333"))


ggplot(ghcn_lax_2019, aes(y=tmax, x=date)) + 
  geom_point(colour="#83b500") +
  labs(y="Max temperature", x="") +
  scale_x_date(date_breaks = "2 years", date_labels = "%Y") +
  theme(panel.background= element_rect(fill="#333333"))

# save scatter plot as pdf and eps
ggsave("output/tutorials/scat_tmax_date_lax_2010_2019.pdf")
ggsave("output/tutorials/scat_tmax_date_lax_2010_2019.eps")

ggplot(ghcn_lax_2019, aes(date, tmax)) + 
  geom_line(colour="#83b500") +
  labs(y="Max temperature", x="") +
  scale_x_date(date_breaks = "2 years", date_labels = "%Y") +
  theme(panel.background= element_rect(fill="#333333"))

# save as pdf and eps
ggsave("output/tutorials/line_tmax_date_lax_2010_2019.pdf")
ggsave("output/tutorials/line_tmax_date_lax_2010_2019.eps")
