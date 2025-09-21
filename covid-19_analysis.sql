--Covid 19 Data Exploration 

--Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types


select * from [Covid-19DB]..CovidDeaths Where continent is not null order by 3,4
--select * from [Covid-19DB]..CovidVaccinations order by 3,4

--Select Data that we are going to be starting with

select location, date, total_cases, new_cases, total_deaths, population
from [Covid-19DB]..CovidDeaths
Where continent is not null
order by 1,2

--Total Cases vs Total Deaths
--Shows likelihood of dying if you contract covid in your country

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from [Covid-19DB]..CovidDeaths
where location like '%Turkey%'
and continent is not null
order by 1,2

--Total Cases vs Population
--Shows what percentage of population infected with Covid

select location, date, population, total_cases, (total_cases/population)*100 as PercentagePopulationInfected
from [Covid-19DB]..CovidDeaths
--where location like '%Turkey%'
order by 1,2

--Countries with Highest Infection Rate compared to Population

select location, population, Max(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentagePopulationInfected
from [Covid-19DB]..CovidDeaths
--where location like '%Turkey%'
Where continent is not null
group by location, population
order by PercentagePopulationInfected desc

--Countries with Highest Death Count per Population

select location,  Max(cast(total_deaths as int)) as TotalDeathCount
from [Covid-19DB]..CovidDeaths
--where location like '%Turkey%'
Where continent is not null
group by location
order by TotalDeathCount desc

--Death rate relative to population ratio

select location, population, Max(cast(total_deaths as int)) as TotalDeathCount,  Max((total_deaths/population))*100 as PercentagePopulationDeaths
from [Covid-19DB]..CovidDeaths
--where location like '%Turkey%'
Where continent is not null
group by location, population
order by PercentagePopulationDeaths desc

--BREAKING THINGS DOWN BY CONTINENT

--Showing contintents with the highest death count per population

select location, Max(cast(total_deaths as int)) as TotalDeathCount
from [Covid-19DB]..CovidDeaths
where continent is null
group by location
order by TotalDeathCount desc


select continent, Max(cast(total_deaths as int)) as TotalDeathCount
from [Covid-19DB]..CovidDeaths
where continent is not null
group by continent
order by TotalDeathCount desc

--Global Numbers

Select SUM(new_cases) as total_cases, SUM(CAST(new_deaths as int)) as total_deaths, SUM(CAST(new_deaths as int)) / SUM(new_cases)*100 as DeathPercentage
from [Covid-19DB]..CovidDeaths
where continent is not null
--Group by date
Order by 1,2


--Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location,
dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From [Covid-19DB]..CovidDeaths dea
JOIN [Covid-19DB]..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3


--Using CTE to perform Calculation on Partition By in previous query

with popvsvac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated) 
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location,
dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From [Covid-19DB]..CovidDeaths dea
JOIN [Covid-19DB]..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3
)
Select *, (RollingPeopleVaccinated/population)*100 from popvsvac

--Using Temp Table to perform Calculation on Partition By in previous query

Drop Table if exists #PercentPopulationVacctinated

Create Table #PercentPopulationVacctinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVacctinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location,
dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From [Covid-19DB]..CovidDeaths dea
JOIN [Covid-19DB]..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null
--order by 2,3

Select *, (RollingPeopleVaccinated/population)*100 from #PercentPopulationVacctinated


-- Creating View to store data for later visualizations

CREATE VIEW PercentPopulationVacctinated 
as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location,
dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From [Covid-19DB]..CovidDeaths dea
JOIN [Covid-19DB]..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3

Select * from PercentPopulationVacctinated