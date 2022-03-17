# michigan_jj

## Repository Structure

├── RMD/
│   ├── County Data_TCS/
|   |    ├── Overall/
│   │    |   ├── Cleaning/
│   │    |   |   ├── county_data_tcs_front_end_cleaning.Rmd # prepare tcs data for front end analytic file
│   │    |   ├── Codebook/
│   │    |   |   ├── mi_tcs_codebook.Rmd # create codebook for tcs data
|   |    ├── Placement/
│   │    |   ├── Cleaning/
│   │    |   |   ├── county_data_tcs_placement_cleaning.Rmd # clean and join tcs data for placement analysis
│   │    |   |   ├── Charge Only/
│   │    |   |   ├── tcs_county_data_placement_charge_only.Rmd # clean and join tcs data for placement/offense analysis
│   ├── Financial Analysis/           
│   │    |   ├── CCF/
│   │    |   |   ├── Analysis/
│   │    |   |   |   ├── jj_mi_ccf_2016_2019.Rmd # prepare tables for ccf, 2016-2019
│   │    |   |   |   ├── jj_mi_ccf_2021.Rmd # prepare tables for ccf, 2021 only
│   │    |   |   ├── Data Cleaning/
│   │    |   |   |   ├── jj_mi_ccf_data_cleaning.Rmd # clean/structure ccf data for analysis
│   │    |   |   ├── Visualization/
│   │    |   |   |   ├── jj_mi_ccf_2021_viz.Rmd # produce viz output for financial ppt
│   │    |   ├── IV-E/
│   │    |   |   ├── Analysis/
│   │    |   |   |   ├── jj_mi_mdhhs_non_subsidy_iv_e.Rmd # clean/analyze iv-e financial data
│   ├── MDHHS/           
│   │    |   ├── Analysis/
│   │    |   |   |   ├── mdhhs_placement_incident_analysis.Rmd # prepare tables for mdhhs analysis
│   │    |   ├── Data Cleaning/
│   │    |   |   |   ├── jj_michigan_placement_cleaning.Rmd # main cleaning file for mdhhs data
│   │    |   |   |   ├── mdhhs_placement_missing_exploration.Rmd # missing data exploration w/ initial data transfer
│   │    |   |   |   ├── mdhhs_placement_missing_exploration_12_15_2021.Rmd # missing data exploration w/ second data
│   │    |   ├── Data Mapping/
│   │    |   |   |   ├── michigan_jj_placement_data_mapping.Rmd # create data file diagram w/ relationships
│   │    |   ├── Data Viz/
│   │    |   |   |   ├── mdhhs_placement_viz.Rmd # syntax for mdhhs viz for ppt
|
├── Join_analytic_files.R  # join standardized data from kalamazoo, wayne, tcs, and pcs for front end analysis
├── MI_JJ_crosstabs.R  # cross tab syntax for front end analysis with analytic file
│── README.md
