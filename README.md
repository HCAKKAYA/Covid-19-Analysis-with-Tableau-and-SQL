# 🦠 COVID-19 Data Exploration & Analysis

## 📌 Project Overview

This project focuses on exploring COVID-19 data using SQL. The analysis covers case counts, death rates, vaccination progress, and comparisons across countries and continents. The goal is to extract meaningful insights and prepare the dataset for further visualization and modeling.

## 🛠️ Skills & Tools Used

SQL Server (T-SQL)

Joins, CTEs, Temp Tables

Window Functions

Aggregate Functions

Data Type Conversions

Views for Visualization

## 📊 Key Analyses

1. General Data Exploration

Extracted relevant columns such as location, date, total_cases, total_deaths, population.

Filtered data by country and continent to prepare for deeper analysis.

2. Cases vs Deaths

Calculated the likelihood of dying if infected (death percentage per country).

Example: Death rate in Turkey compared to global averages.

3. Cases vs Population

Computed percentage of population infected.

Identified countries with the highest infection rates relative to population.

4. Death Analysis

Ranked countries by highest death count.

Calculated death rate per population for fair comparison.

Compared deaths by continent level.

5. Global Numbers

Aggregated total cases and deaths globally.

Calculated global death percentage over time.

6. Vaccination Analysis

Joined CovidDeaths and CovidVaccinations tables.

Tracked rolling number of vaccinated people.

Used CTEs and Temp Tables to calculate:

Rolling vaccinations per country.

Percentage of population vaccinated.

Created a View for later visualization.

## 📈 Visualization Ideas

The created datasets can be visualized using:

### Tableau / Power BI

### Examples:

Global cases & deaths trend (time-series).

Heatmap: infection % by country.

Vaccination progress vs death rates.

Continent-level comparisons.

## 🚀 Next Steps

Expand analysis with demographic & economic factors (median age, GDP, smoking rate, etc.).

Build dashboards for interactive exploration.

Apply forecasting models (ARIMA, Prophet) for case/death predictions.
