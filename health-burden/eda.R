# Exploratory data analysis (see readme for more detail)
# Feel free to follow these steps, or complete your own EDA

# Set up (install packages if you don't have them)
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(vioplot)
setwd('~/Documents/info-370/eda/health-burden/')
risk.data <- read.csv('./data/prepped/risk-data.csv', stringsAsFactors = FALSE) 

######################
### Data Structure ###
######################

## Using a variety of functions, investigate the structure of your data, such as:

# Dimensions, column names, structure, summaries, etc.

# Replacing missing values...?

dim(risk.data)
str(risk.data)
names(risk.data)
length(risk.data)
summary(risk.data)

risk.data[is.na(risk.data)] <- 0

###########################
### Univariate Analysis ###
###########################

## Using a variety of approaches, investigate the structure each (risk column) individually

# Summarize data

summary(risk.data[,8:ncol(risk.data)])
 
# Create histograms, violin plots, boxplots
hist(risk.data$alcohol.use)
hist(risk.data$drug.use)
hist(risk.data$high.meat)
hist(risk.data$low.exercise)
hist(risk.data$smoking)

vioplot(
  risk.data$smoking,
  risk.data$alcohol.use,
  risk.data$drug.use,
  risk.data$high.meat,
  risk.data$low.exercise,
  names=c('Smoking','Alcohol use', 'Drug use', 'High Meat', 'Low exercise')
)

boxplot(risk.data$alcohol.use)
boxplot(risk.data$drug.use)
boxplot(risk.data$high.meat)
boxplot(risk.data$low.exercise)
boxplot(risk.data$smoking)


####################################
### Univariate Analysis (by age) ###
####################################

# Investiage how each risk-variable varies by **age group**


# Create histograms, violin plots, boxplots. Calculate values as needed. 
p <- qplot(smoking, data = risk.data, geom = "histogram")
p + facet_wrap(risk.data$age)

####################################
### Univariate Analysis (by sex) ###
####################################

# Investiage how each risk-variable varies by **sex**

# Compare male to female values -- requires reshaping (and dropping population)!


########################################
### Univariate Analysis (by country) ###
########################################

## Investiage how each risk-variable varies by **country**

# Aggregate by country

# Create a choropleth map (see https://plot.ly/r/choropleth-maps/)

###########################
### Bivariate Analysis ####
###########################

# Compare risks-variables to one another (visually)
