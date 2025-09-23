# 🦠 COVID-19 Data Exploration & Dashboard

## 📌 Project Overview

This project explores COVID-19 data using **SQL** for analysis and **Tableau** for visualization.  
The study covers case counts, death rates, vaccination progress, and cross-country comparisons.  
The goal is to extract meaningful insights and make them accessible through an **interactive dashboard**.

🔗 **[View the Interactive Tableau Dashboard](https://public.tableau.com/views/Book1_17586351383330/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

---

## 🛠️ Skills & Tools Used

- **SQL Server (T-SQL)**
  - Joins, CTEs, Temp Tables
  - Window Functions
  - Aggregate Functions
  - Data Type Conversions
  - Views for Visualization
- **Tableau**
  - Interactive dashboards
  - Charts, heatmaps, and time-series trends

---

## 📊 Key Analyses

1. **General Data Exploration**

   - Selected relevant columns: location, date, total_cases, total_deaths, population.
   - Filtered by country and continent for deeper analysis.

2. **Cases vs Deaths**

   - Calculated death percentage (likelihood of dying if infected).
   - Compared Turkey with global averages.

3. **Cases vs Population**

   - Computed infection % of total population.
   - Identified countries with the highest infection rates.

4. **Death Analysis**

   - Ranked countries by highest death count.
   - Calculated fair comparisons: deaths relative to population.
   - Compared deaths at the continent level.

5. **Global Numbers**

   - Aggregated total cases and deaths worldwide.
   - Tracked global death percentage over time.

6. **Vaccination Analysis**
   - Joined **CovidDeaths** and **CovidVaccinations** tables.
   - Tracked rolling vaccination counts.
   - Used CTEs & Temp Tables for:
     - Rolling vaccinations per country
     - Percentage of population vaccinated
   - Created a **SQL View** for direct use in Tableau.

---

## 📈 Visualization Highlights

The SQL-prepared dataset was visualized in **Tableau**, resulting in an interactive dashboard that highlights key insights:

- 🌍 **Global Numbers**

  - Total cases, total deaths, and overall death percentage.

- 📊 **Total Deaths per Continent**

  - Bar chart comparing cumulative deaths across continents.

- 🗺️ **Percent Population Infected per Country**

  - World map (heatmap) showing infection percentages by country.

- 📈 **Percent Population Infected Over Time**
  - Time-series line chart tracking how infection spread by country (e.g., U.S., Turkey, U.K., Mexico).

---

## 🚀 Next Steps

- Add demographic & economic factors (median age, GDP, smoking rate, etc.).
- Extend dashboard with more interactive filters.
- Apply forecasting models (**ARIMA, Prophet**) for predictive analysis.

---

## 📸 Dashboard Preview

![Dashboard Screenshot](covid-19%20dashboard.png)

🔗 **[View the Interactive Tableau Dashboard](https://public.tableau.com/views/Book1_17586351383330/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**
