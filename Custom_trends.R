### Custom trend period
library(tidyverse)
#pak::pkg_install("bbsBayes/bbsBayes2@v1.1.1") # necessary to support saved objects from previous version
library(bbsBayes2)

trend_first_year <- 2002
trend_last_year <- 2022

species_list <- read_csv("website/2022 BBS trends for website.csv") %>%
  filter(geo.area == "ON") %>%
    select(sp,species) %>%
  distinct() %>%
    as.data.frame()

#species_list <- readRDS("data/prairie_sp_table.rds")

trends_out <- NULL
for(j in 1:nrow(species_list)){

  species <- species_list[j,"species"]
  aou <- species_list[j,"sp"]#as.integer(search_species(species)[1,"aou"])

  inds <- readRDS(paste0("indices/Inds_",aou,".rds")) #n_smooth


  trends <- generate_trends(inds,
                            min_year = trend_first_year,
                            max_year = trend_last_year,
                            hpdi = TRUE,
                            prob_decrease = c(0,30,50))

  tmp <- trends$trends %>%
    mutate(english = species)
  trends_out <- bind_rows(trends_out,tmp)

}



trends_out <- trends_out  %>%
  mutate(across(where(is.double) & !contains("year") &
                  !starts_with("n_") & !starts_with("bbs_num"),~signif(.,3)))



trends_on <- trends_out %>%
  filter(grepl("CA-ON",region) | region == "ON" | region == "Canada")

# write_csv(trends_out,paste0("extra_output/prairie_sp_trends",
#                             trend_first_year,"_",trend_last_year,".csv"))


write_csv(trends_on,paste0("extra_output/Ontario_trends",
                            trend_first_year,"_",trend_last_year,".csv"))


