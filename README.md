# michigan_jj

## Project Description

Michigan launched an IOYouth initiative in 2021 to develop data-driven recommendations to reform the state’s juvenile justice system. Michigan has one of the highest rates of detained youth in the country, especially for low-level, noncriminal behavior. CSG Justice Center staff will perform a comprehensive examination of the state’s juvenile justice system. This will involve data analysis as well as focus groups and interviews with key stakeholders, including youth and families most impacted by the system. The effort will be conducted under the direction of the bipartisan Task Force on Juvenile Justice Reform.

## Assigned Research Staff

Becky Cohen, Emily Rogers, Andrew Byrum, Josh Mallett (joined 2/2022), Rachael Druckhammer (joined 2/2022), Amund Tallaksen (joined 2/2022)

## Teams/SharePoint project folder links

Sharepoint path to JC Research folder for Michigan JJ project: https://csgorg.sharepoint.com/:f:/s/Team-JC-Research/EoGjsT6a1bRJm53JzJD6zlIBydiIFUYURvvt2B-LF4k2tA?e=mQf2vh

## Repository Structure

```
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
│   ├── Front End Analysis/           
│   │    |   ├── mi_jj_front_end_prelim_output.Rmd # produce cross-tabs, preliminary descriptives on petitions/adjudications
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
│   ├── Misc/           
│   │    |   ├── example_line_plot_indiana_jj.Rmd # example syntax to plot change in referrals/petitions over time for reference
│   ├── county_lookup/           
│   │    |   ├── ezapop_jj_base_data_clean_sas.rmd # syntax to create county-level juvenile population estimates
|
|
├── .gitignore  
├── Join_analytic_files.R  # join standardized data from kalamazoo, wayne, tcs, and pcs for front end analysis
├── MI_JJ_crosstabs.R  # cross tab syntax for front end analysis with analytic file
└── README.md
```
