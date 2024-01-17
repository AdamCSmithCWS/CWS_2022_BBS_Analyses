# CWS_2022_BBS_Analyses

Repo documenting the entire workflow used to generate the Canadian Wildlife Service's analysis of population status and trends from the North American Breeding Bird Survey, 1970-2022. Using the 2023 release version of the North American Breeding Bird Survey, and the [spatially explicit GAMYE model defined in this paper](https://doi.org/10.1093/ornithapp/duad056). 

The R-scripts are numbered to indicate the workflow. In general, each script requires that the previous scripts have been run (e.g., 1_bbs_script_doparallel.R depends on output created in 0_species_list_prep.R). 

Note: these analyses require significant computational resources. This full set of scripts were conducted on a computer with 64 cores and 128GB of RAM. Fitting the Bayesian models using Stan is done in script 1_bbs_script_parallel.R, which requires the greatest time and resources (minimum 4-cores for a single species). There are numerous uses of the packages foreach and doParallel to analyse and/or summarise across many species. These foreach loops can be replaced with a for loop if analysing or summarising output for a single species.

The analyses use the R-package [bbsBayes2](https://bbsbayes.github.io/bbsBayes2/). 

The summaries and functions in all scripts after 1_bbs_script_parallel.R (e.g., all summaries of annual indices, trends, maps, etc.) can be run using saved model output for a given species. If you would like access to that saved model output for this analysis, please get in touch. In the near future, we are hoping to have a simple way to archive this saved model output in an openly accessible format, so check back here for updates.

## Estimates from these analyses

This [Google Drive](https://drive.google.com/drive/folders/1aq9GryGHtqcsv0sOq6BkZrRE9FdhjjvE?usp=drive_link) contains all estimates of trends and indices of annual abundance (population trajectories) in a downloadable format. It also includes population trajectory graphs, maps of estimated trends for long-term, short-term, and three-generation periods, plus other saved output. There are readme files in both English and French in the folder that explain the contents in more detail.

