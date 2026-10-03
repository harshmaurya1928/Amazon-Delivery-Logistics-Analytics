# Amazon-Delivery-Logistics-Analytics
End-to-end Amazon delivery analytics project using Python, MySQL, and Power BI to analyze delivery performance, traffic, weather, vehicles, areas, and product categories.


# Amazon Delivery & Logistics Analytics #

##  Project Overview ##

This project analyzes Amazon delivery data to understand the factors associated with delivery time and identify operational patterns across traffic conditions, weather, vehicles, delivery areas, and product categories.

The project follows an end-to-end data analytics workflow using Python, MySQL, and Power BI, starting from data cleaning and exploratory analysis and ending with an interactive business dashboard.

## Business Objective ##

The main objectives of this project are to:

- Analyze overall delivery performance.

- Identify factors associated with longer delivery times.

- Understand the impact of traffic and weather conditions.

- Compare delivery performance across vehicle types and areas.

- Identify categories with higher delivery times.

- Analyze monthly delivery volume.

- Provide data-driven operational insights and recommendations.

## Tools & Technologies ##

#### Python

- Pandas

- NumPy

- Matplotlib

- Seaborn

#### MySQL ####

- Aggregations

- GROUP BY / HAVING

- Subqueries

- Window Functions

- RANK / DENSE_RANK

- CTEs

#### Power BI ####

- Data visualization

- Interactive dashboards

- Slicers

- Drill-through

- Conditional formatting

- DAX

#### GitHub : Project documentation and version control. ####

## Dataset ## 

#### Dataset : Project documentation and version control. ####

The dataset contains 43,739 delivery records and 16 original columns.

###  Python EDA ###

The dataset was first explored and analyzed using Python.

#### Data Quality Checks ####

<img src="https://file+.vscode-resource.vscode-cdn.net/c%3A/Users/Harsh%20maurya/OneDrive/Desktop/amazone%20data/Images/Dataset%20overview%20screenshot.png?version%3D1791019397220" width="900">

The following checks were performed:

- Dataset shape and structure.

- Column inspection.

- Missing-value analysis.

- Duplicate Order_ID checks.

- Investigation of missing Weather values.

- Comparison of delivery times for records with and without missing values.

### Missing Values ###

<img src="https://file+.vscode-resource.vscode-cdn.net/c%3A/Users/Harsh%20maurya/OneDrive/Desktop/amazone%20data/Images/Data%20quality.png?version%3D1791019428045" width="900">

The dataset contained:

- 54 missing Agent Ratings.

- 91 missing Weather values.

- No duplicate Order_ID values.

The missing Weather records were investigated further. The corresponding Traffic values were represented as NaN, and their vehicle distribution and average delivery time were also examined.

Instead of deleting these records without evidence, the missing values were retained to avoid unnecessarily removing valid delivery records.

## Exploratory Analysis

The following analyses were performed using Pandas:

- Monthly delivery performance

- Monthly delivery volume

- Traffic impact on delivery time

- Weather impact on delivery time

- Vehicle performance

- Area performance

- Category performance

- Traffic and Vehicle analysis

- Agent Rating vs Delivery Time

- Traffic and Weather analysis

### Visualization

Matplotlib and Seaborn were used to create visualizations including:

- Delivery time distribution

- Delivery time by traffic condition

- Delivery time by weather condition

- Delivery time by vehicle type

- Average delivery time by category

- Delivery time by area

- Traffic and weather heatmap

- Monthly delivery volume

## MySQL Analysis

<img src="https://file+.vscode-resource.vscode-cdn.net/c%3A/Users/Harsh%20maurya/OneDrive/Desktop/amazone%20data/Images/Screenshot%202026-09-26%20155239.png?version%3D1791019035397" width="900">

The cleaned dataset was imported into MySQL for structured analysis.

### SQL Analysis Performed

The analysis included:

- Total number of deliveries

- Average delivery time

- Minimum and maximum delivery time

- Average agent rating

- Delivery volume by traffic condition

- Average delivery time by traffic condition

- Weather-wise delivery performance

- Vehicle-wise delivery performance

- Area-wise delivery performance

- Category-wise delivery performance

- Top 5 slowest product categories

- Traffic + Vehicle analysis

- Traffic + Weather analysis

- Deliveries above average delivery time

- Traffic conditions with above-average delivery times

- Vehicle ranking

- Category ranking

- Vehicle ranking within traffic conditions

- Top 2 slowest categories within each area

## Advanced SQL Concepts

<img src="https://file+.vscode-resource.vscode-cdn.net/c%3A/Users/Harsh%20maurya/OneDrive/Desktop/amazone%20data/Images/Screenshot%202026-09-26%20155308.png?version%3D1791019545419" width="900">

The project also uses:

- Subqueries

- HAVING

- RANK()

- DENSE_RANK()

- PARTITION BY

- Common Table Expressions (CTEs)

## Power BI Dashboard

The analyzed data was visualized in Power BI through a 3-page interactive dashboard.

### Delivery Overview ###

<img src="https://file+.vscode-resource.vscode-cdn.net/c%3A/Users/Harsh%20maurya/OneDrive/Desktop/amazone%20data/Images/dashboard_overview.png?version%3D1791017881447" width="900">

The overview page contains:

- Total Deliveries

- Average Delivery Time

- Average Agent Rating

- Delivery Time Range

- Average Delivery Time by Weather

- Deliveries by Vehicle

- Average Delivery Time by Traffic

- Monthly Delivery Volume

### Filters 

Users can interact with the dashboard using:

- Weather

- Area

- Month

- Traffic

## Delivery Performance Analysis

<img src="https://file+.vscode-resource.vscode-cdn.net/c%3A/Users/Harsh%20maurya/OneDrive/Desktop/amazone%20data/Images/dashboard_operational_analysis.png?version%3D1791019632483" width="900">

This page focuses on relationships between operational factors.

##### Visuals include:

- Delivery Time by Vehicle

- Delivery Time by Area

- Average Delivery Time by Category

- Average Delivery Time by Traffic and Vehicle

- Average Delivery Time by Traffic and Weather

These visuals help identify differences in delivery performance across operational conditions.

## Detailed Analysis

<img src="https://file+.vscode-resource.vscode-cdn.net/c%3A/Users/Harsh%20maurya/OneDrive/Desktop/amazone%20data/Images/dashboard_deep_dive.png?version%3D1791019654054" width="900">

The third page provides more detailed analysis through:

- Top 2 Slowest Product Categories by Area

- Category/Area performance matrix

- Vehicle ranking within traffic conditions

- Detailed delivery-level table

The detailed table allows users to inspect individual delivery records using fields such as:

- Order ID

- Category

- Area

- Traffic

- Vehicle

- Weather

## Key Insights

### 1. Traffic is associated with longer delivery times

Highly congested traffic conditions show higher average delivery times compared with lower traffic conditions.

This indicates that traffic conditions are an important operational factor when analyzing delivery performance.

#### Recommendation: Delivery operations could consider traffic-aware route planning and agent assignment to reduce delays during congested periods. ####

### 2. Weather conditions are associated with delivery performance

Average delivery time varies across different weather conditions.

Some weather conditions show noticeably higher average delivery times than others.

#### Recommendation: Delivery planning could account for unfavorable weather conditions by allowing additional delivery time and considering safer or more efficient routes.

### 3. Vehicle performance varies across traffic conditions

The analysis of Traffic + Vehicle combinations shows that vehicle performance is not identical across different traffic conditions.

#### Recommendation: Vehicle allocation can be evaluated according to traffic conditions rather than treating all vehicle types equally.

### 4. Delivery performance differs across areas

Average delivery time varies between delivery areas.

However, areas with very small numbers of observations should be interpreted carefully.

#### Recommendation: Operations teams can investigate areas with consistently higher delivery times to identify possible logistical or routing issues.

### 5. Product categories show differences in delivery time

Average delivery time varies across product categories and areas.

The category-level analysis helps identify combinations that may require additional operational attention.

#### Recommendation: Categories with consistently higher delivery times can be investigated for possible handling, preparation, or delivery-related delays.

## Skills Demonstrated

- Data Cleaning and Data Quality Analysis

- Exploratory Data Analysis

- Python / Pandas

- Matplotlib and Seaborn

- SQL Aggregations

- Subqueries

- Window Functions

- Ranking using RANK() and DENSE_RANK()

- CTEs

- Power BI Dashboard Development

- DAX

- Interactive Data Visualization

- Business-oriented Data Analysis

- Data-driven Recommendations

## Conclusion

This project demonstrates an end-to-end data analytics workflow, from raw delivery data exploration and quality checks to SQL analysis and interactive Power BI visualization.

The analysis focuses on identifying operational factors associated with delivery performance and translating those findings into practical business insights.
