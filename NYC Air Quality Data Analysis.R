# Packages
library(dplyr)
library(ggplot2)

load_and_clean_data <- function(file_path) {
  # Load data
  data <- read.csv("C:\\Users\\Kaylen\\Downloads\\Air_Quality.csv")
  
  # Delete columns
  data <- data %>%
    select(-Unique.ID, -Indicator.ID, -Message)
  
  # Rename columns (new name = old name)
  data <- data %>%
    rename(
      Type = Name,
      MeasureType = Measure,
      MeasureUnit = Measure.Info,
      LocationType = Geo.Type.Name,
      LocationID = Geo.Join.ID,
      LocationName = Geo.Place.Name,
      Value = Data.Value,
      Year = Start_Date,
      TimePeriod = Time.Period
    )
  
  # Convert Year to Date format & make numeric
  data$Year <- as.Date(data$Year, format="%m/%d/%Y")
  data$Value <- as.numeric(data$Value)
  
  return(data)
}

air_quality_data <- load_and_clean_data("Air_Quality.csv")

# Fine particles (PM 2.5)
temporal_pm25_data <- air_quality_data %>%
  filter(Type == "Fine particles (PM 2.5)") %>%
  group_by(Year = as.Date(Year)) %>%
  summarize(AverageValue = mean(Value, na.rm = TRUE))

ggplot(temporal_pm25_data, aes(x = Year, y = AverageValue, color = Year)) + geom_line() + expand_limits(y = 0) +
  labs(title = "Fine particles (PM 2.5) over time in NYC", y = "µg/m³") + theme_minimal()

# Nitrogen dioxide (NO2)
temporal_no2_data <- air_quality_data %>%
  filter(Type == "Nitrogen dioxide (NO2)") %>%
  group_by(Year = as.Date(Year)) %>%
  summarize(ppb = mean(Value, na.rm = TRUE))

ggplot(temporal_no2_data, aes(x = Year, y = ppb, color = Year)) + geom_line() + expand_limits(y = 0) +
  labs(title = "Nitrogen dioxide (NO2) over time in NYC") + theme_minimal()

# Ozone (O3)
temporal_o3_data <- air_quality_data %>%
  filter(Type == "Ozone (O3)") %>%
  group_by(Year = as.Date(Year)) %>%
  summarize(ppb = mean(Value, na.rm = TRUE))

ggplot(temporal_o3_data, aes(x = Year, y = ppb, color = Year)) + geom_line() + expand_limits(y = 0) +
  labs(title = "Ozone (O3) over time in NYC") + theme_minimal()

# Annual vehicle miles traveled (per million square miles)
temporal_data_vmt <- air_quality_data %>%
  filter(Type == "Annual vehicle miles traveled") %>%
  group_by(Year = as.Date(Year)) %>%
  summarize(AverageValue = mean(Value, na.rm = TRUE))
# NOTE: Data was recorded on January 1st of years 2005, 2010, and 2019 - not before, in between, or after.
ggplot(temporal_data_vmt, aes(x= Year, y = AverageValue, color = Year)) + geom_line() + expand_limits(y = 0) +
  labs(title = "Vehicles miles traveled over time in NYC", y = "per million square miles") + theme_minimal()

# Data from New York City shows a growing trend in vehicle miles traveled, with an increase in average annual miles driven since 2005.
# Despite some fluctuations, levels of PM2.5 and NO2 in New York City's air show a steady, linear decline over time.
# This consistent decrease suggests that actions such as policy interventions or advancements in clean technology have contributed to improved air quality in New York City.
# In contrast, O3 levels have shown some fluctuations but currently exhibit an upward trend.