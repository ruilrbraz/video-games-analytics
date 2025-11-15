# **Video Games Sales Analysis: Optimizing Genre and Platform for ROI**

This repository contains the complete data pipeline, database structure, and core analytical queries used to inform a new game studio's debut title strategy.

## **Project Goal & Key Findings**

**Goal:** To determine the optimal genre, platform, and quality benchmark for a new game studio by analyzing historical sales data and critical reception.

**Key Finding Summary:**

* **Quality vs. Volume:** The **Sports** genre demands a higher average critic score (**74**) for success than the highest-selling **Action** genre (**68**).  
* **Regional Strategy:** The **Role-Playing** genre shows an overwhelming concentration of sales in the **Japan** market (over **38%** of global sales), confirming the strategic value of localization investment for that genre.

The full analysis and visualizations are available in the final presentation: [Link to Final Presentation (Gamma)](https://gamma.app/docs/Optimizing-Genre-and-Platform-for-ROI-bs1wtmuznhvmyt8)

## **Research Objectives & Hypotheses**

The core analysis was driven by testing the following hypotheses:

1. **Hypothesis 1 (Success Metric Correlation):** There is a stronger positive correlation between a game's average 'Critic Score' and its 'Global Sales' than between its 'User Score' and 'Global Sales.'  
2. **Hypothesis 2 (Regional Profitability & Investment):** The 'Role-Playing' genre shows a significantly higher average sales percentage in the Japan market compared to the 'Action' genre.

## **Database Structure & ETL Pipeline**

The project uses a clean, normalized **MySQL** database with a Star Schema design to ensure efficient retrieval of metrics (Games) based on characteristics (Publishers and Developers).

**ETL Pipeline & Data Sources:**

* **Source 1 (Primary):** Video\_Games.csv for core sales, scores, genre, and platform data.  
* **Source 2 (Enrichment):** RAWG API was used to attempt to enrich the Publishers table with company metadata (founding year).  
* **Transformation:** **Pandas** was used to clean non-numeric data ('tbd'), drop rows with missing game names (upholding the NOT NULL constraint), and establish unique Dimension tables.  
* **Loading:** **Python** with **SQLAlchemy** was used to load the transformed data directly into the relational MySQL tables, which successfully bypassed all file-based security and encoding issues.

**Database Structure (Tables):**

* **Games (Fact Table):** Contains all metrics (sales, scores, year, platform). Linked to dimensions via Foreign Keys.  
* **Publishers (Dimension):** Stores unique publisher names and enriched founding\_year data.  
* **Developers (Dimension):** Stores unique developer names.

## **Key Analytical Queries**

The final insights were derived from these complex SQL queries:

* **Genre Performance:** Uses GROUP BY, SUM, and AVG to compare sales volume against average scores, establishing quality benchmarks by genre.  
* **Regional Sales Mix:** Employs a JOIN and arithmetic functions to calculate the percentage of total sales coming from the **Japan** and **North America** regions for target genres (supporting Hypothesis 2).  
* **Score Discrepancy by Platform:** Uses AVG and subtraction to calculate the gap between critic opinion and user opinion for major platforms.  
* **Platform Market Share Over Time:** Uses GROUP BY year\_of\_release and CASE statements to track the long-term sales dominance of major console families (Nintendo, PlayStation, Xbox).

## **Repository Contents**

* **game\_studio\_schema.sql**: The Data Definition Language (DDL) file for creating the three database tables.  
* **data\_transform\_load\_mysql.py**: The main ETL script for cleaning and loading the core sales data.  
* **enrich\_data\_dotenv.py**: The Python script used for connecting to the RAWG API and enriching the dimension tables.  
* **.env**: Secure file (ignored by Git) storing all database and API credentials.  
* **analysis\_notebook.ipynb**: Jupyter Notebook containing all the final queries, data fetching logic, and Matplotlib/Seaborn visualizations.
