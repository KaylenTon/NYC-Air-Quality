# NYC Air Quality Analysis

This project analyzes the air quality of New York City by examining temporal trends in key pollutants and traffic data. The primary focus is on the following metrics:

- **Fine Particles (PM 2.5)**
- **Nitrogen Dioxide (NO2)**
- **Ozone (O3)**
- **Vehicle Miles Traveled (VMT)**

## Project Overview

In this project, I:

1. **Imported** the New York City air quality data.
2. **Cleaned and manipulated** the dataset for analysis.
3. **Visualized** the temporal trends of the pollutants and traffic data through line charts.

The analysis provides insights into how air quality has evolved over time and the potential impact of traffic on pollution levels.

## Data Source

The dataset was sourced from [data.gov](https://catalog.data.gov/dataset/air-quality). The CSV file containing the dataset is available in the repository for download.

## Requirements

To run this project, you will need:

- **R** (preferably RStudio for ease of use)
- Required R packages (listed in the script)

## Running the Project

1. Clone or download this repository to your local machine.
2. Open RStudio (or another R environment).
3. Upload the provided CSV file and ensure it is correctly linked to the script.
4. Run the R script from top to bottom to reproduce the data analysis and visualizations.

## Analysis Steps

1. **Data Import**: The data is loaded from the provided CSV file.
2. **Data Cleaning**: Missing values are handled, and the data is transformed into the appropriate format for analysis.
3. **Data Manipulation**: Relevant columns are selected, and separate data frame objects are created.
4. **Visualization**: Separate line charts are created to display the temporal trends of:
   - PM 2.5 levels
   - Nitrogen Dioxide (NO2)
   - Ozone (O3)
   - Vehicle Miles Traveled (VMT)
  
## Visualizations

The project includes separate line charts for each of the following metrics:

- **PM 2.5**: A measure of fine particulate matter in the air.
- **NO2**: Nitrogen Dioxide concentration levels.
- **O3**: Ozone concentration levels.
- **VMT**: The number of vehicle miles traveled in New York City.

## Repository Contents

- `nyc_air_quality_analysis.R`: The main R script that performs data analysis and generates visualizations.
- `nyc_air_quality_data.csv`: The raw dataset used for the analysis.
- `README.md`: This file, which provides an overview of the project.

## Conclusion
Data from New York City shows a growing trend in vehicle miles traveled, with an increase in average annual miles driven since 2005. Despite some fluctuations, levels of PM2.5 and NO2 in New York City's air show a steady, linear decline over time. This consistent decrease suggests that actions such as policy interventions or advancements in clean technology have contributed to improved air quality in New York City. In contrast, O3 levels have shown some fluctuations but currently exhibit an upward trend.
