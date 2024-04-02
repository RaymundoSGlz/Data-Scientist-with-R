library(magrittr)
library(ggplot2)
library(dplyr)
usa_census_regions <- readRDS("data/usa_census_regions.rds")
census_regions <- unique(usa_census_regions$census_region)

# Function to calculate the reciprocal of a number
# Parameters:
#   - x: The number for which the reciprocal is calculated
# Returns:
#   The reciprocal of the input number
get_reciprocal <- function(x) {
  1 / x
}

# Function to convert acres to square yards
# Parameters:
#   - acres: The number of acres to be converted
# Returns:
#   The equivalent number of square yards
acres_to_sq_yards <- function(acres) {
  sq_yards <- acres * 4840
  return(sq_yards)
}

# Function to convert yards to meters
# Parameters:
#   - yards: The number of yards to be converted
# Returns:
#   The equivalent number of meters
yards_to_meters <- function(yards) {
  meters <- yards * 0.9144
  return(meters)
}

# Function to convert square meters to hectares
# Parameters:
#   - sq_meters: The number of square meters to be converted
# Returns:
#   The equivalent number of hectares
sq_meters_to_hectares <- function(sq_meters) {
  hectares <- sq_meters / 10000
  return(hectares)
}

# Function to convert square yards to square meters
# Parameters:
#   - sq_yards: The number of square yards to be converted
# Returns:
#   The equivalent number of square meters
sq_yards_to_sq_meters <- function(sq_yards) {
  sq_yards %>%
    # Take the square root
    sqrt() %>%
    # Convert yards to meters
    yards_to_meters() %>%
    # Square it
    `^`(2)
}

# Function to convert acres to hectares
# Parameters:
#   - acres: The number of acres to be converted
# Returns:
#   The equivalent number of hectares
acres_to_hectares <- function(acres) {
  acres %>%
    # Convert acres to sq. yards
    acres_to_sq_yards() %>%
    # Convert sq. yards to sq. meters
    sq_yards_to_sq_meters() %>%
    # Convert sq. meters to hectares
    sq_meters_to_hectares()
}

# Function to convert harmonic acres to hectares
# Parameters:
#   - acres: The number of acres to be converted
# Returns:
#   The equivalent number of hectares
harmonic_acres_to_hectares <- function(acres) {
  acres %>%
    # Get the reciprocal
    get_reciprocal() %>%
    # Convert acres to hectares
    acres_to_hectares() %>%
    # Get the reciprocal again
    get_reciprocal()
}

# Function to convert pounds to kilograms
# Parameters:
#   - lbs: The number of pounds to be converted
# Returns:
#   The equivalent number of kilograms
lbs_to_kgs <- function(lbs) {
  lbs %>%
    multiply_by(0.45359237)
}

# Function to convert bushels to pounds
# Parameters:
#   - bushels: The number of bushels to be converted
#   - crop: The type of crop (barley, corn, or wheat)
# Returns:
#   The equivalent number of pounds
bushels_to_lbs <- function(bushels, crop) {
  # Define a lookup table of scale factors
  scale_factors <- c(barley = 48, corn = 56, wheat = 60)
  # Extract the value for the crop
  scale_factor <- scale_factors[crop]
  # Multiply by the no. of bushels
  bushels %>%
    multiply_by(scale_factor)
}

# Function to convert bushels to kilograms
# Parameters:
#   - bushels: The number of bushels to be converted
#   - crop: The type of crop (barley, corn, or wheat)
# Returns:
#   The equivalent number of kilograms
bushels_to_kgs <- function(bushels, crop) {
  bushels %>%
    # Convert bushels to lbs for this crop
    bushels_to_lbs(crop) %>%
    # Convert lbs to kgs
    lbs_to_kgs()
}

# Function to convert bushels per acre to kilograms per hectare
# Parameters:
#   - bushels_per_acre: The number of bushels per acre to be converted
#   - crop: The type of crop (barley, corn, or wheat)
# Returns:
#   The equivalent number of kilograms per hectare
bushels_per_acre_to_kgs_per_hectare <- function(bushels_per_acre, crop = c("barley", "corn", "wheat")) {
  # Match the crop argument
  crop <- match.arg(crop)
  bushels_per_acre %>%
    # Convert bushels to kgs for this crop
    bushels_to_kgs(crop) %>%
    # Convert harmonic acres to ha
    harmonic_acres_to_hectares()
}

#' Fortify data with metric units
#'
#' This function takes a data frame and a crop as input and adds two new columns to the data frame:
#' - `farmed_area_ha`: the farmed area in hectares, calculated by converting the `farmed_area_acres` column to hectares using the `acres_to_hectares` function.
#' - `yield_kg_per_ha`: the yield in kilograms per hectare, calculated by converting the `yield_bushels_per_acre` column to kilograms per hectare using the `bushels_per_acre_to_kgs_per_hectare` function.
#'
#' @param data A data frame containing the data to be fortified.
#' @param crop A character string specifying the crop for which the data is being fortified.
#'
#' @return The fortified data frame with the additional columns.
#'
#' @examples
#' data <- fortify_with_metric_units(data, "wheat")
#' head(data)
fortify_with_metric_units <- function(data, crop) {
  data %>%
    mutate(
      farmed_area_ha = acres_to_hectares(farmed_area_acres),
      yield_kg_per_ha = bushels_per_acre_to_kgs_per_hectare(
        yield_bushels_per_acre,
        crop = crop
      )
    )
}

#' Fortify data with census region
#'
#' This function takes a data frame as input and adds a new column to the data frame:
#' - `census_region`: the census region corresponding to each state, obtained by joining the data frame with the `usa_census_regions` data frame using the "state" column.
#'
#' @param data A data frame containing the data to be fortified.
#'
#' @return The fortified data frame with the additional column.
#'
#' @examples
#' data <- fortify_with_census_region(data)
#' head(data)
fortify_with_census_region <- function(data) {
  data %>%
    inner_join(usa_census_regions, by = "state")
}

#' Plot yield vs. year
#'
#' This function takes a data frame as input and creates a line plot of yield (in kilograms per hectare) against year.
#' Each line represents a different state.
#' The plot also includes a smoothed line.
#'
#' @param data A data frame containing the data to be plotted.
#'
#' @examples
#' plot_yield_vs_year(data)
plot_yield_vs_year <- function(data) {
  ggplot(data, aes(year, yield_kg_per_ha)) +
    geom_line(aes(group = state)) +
    geom_smooth()
}

#' Plot yield vs. year by census region
#'
#' This function takes a data frame as input and creates a line plot of yield (in kilograms per hectare) against year, grouped by census region.
#' Each line represents a different state within the same census region.
#' The plot also includes a smoothed line.
#'
#' @param data A data frame containing the data to be plotted.
#'
#' @examples
#' plot_yield_vs_year_by_region(data)
plot_yield_vs_year_by_region <- function(data) {
  ggplot(data, aes(year, yield_kg_per_ha)) +
    geom_line(aes(group = state)) +
    geom_smooth() +
    facet_wrap(~census_region)
}

#' Run GAM model to predict grain yields by year and region
#'
#' This function runs a Generalized Additive Model (GAM) to predict grain yields
#' based on the year and census region.
#'
#' @param data A data frame containing the variables 'yield_kg_per_ha', 'year',
#'             and 'census_region'.
#'
#' @return A GAM model object.
#'
#' @examples
#' data <- read.csv("grain_yield_data.csv")
#' model <- run_gam_yield_vs_year_by_region(data)
#'
run_gam_yield_vs_year_by_region <- function(data) {
  gam(yield_kg_per_ha ~ s(year) + census_region, data = data)
}

#' Predict grain yields based on a GAM model
#'
#' This function takes a GAM model object and a year as input, and predicts the
#' grain yields in kilograms per hectare for each census region.
#'
#' @param model A GAM model object obtained from the 'run_gam_yield_vs_year_by_region' function.
#' @param year The year for which to predict the grain yields.
#'
#' @return A data frame with the predicted grain yields for each census region.
#'
#' @examples
#' model <- run_gam_yield_vs_year_by_region(data)
#' predicted_yields <- predict_yields(model, 2022)
#'
predict_yields <- function(model, year) {
  predict_this <- data.frame(
    year = year,
    census_region = census_regions
  )
  pred_yield_kg_per_ha <- predict(model, predict_this, type = "response")
  predict_this %>%
    mutate(pred_yield_kg_per_ha = pred_yield_kg_per_ha)
}