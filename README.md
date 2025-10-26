# Video Games Analytics
Ironhack Data Analytics Bootcamp Mini Project - SQL: From Data to Insight

📝 Project README Outline: Video Game Analytics
This structure follows the project requirements for documenting the project's purpose and scope.
1. Project Title and Overview

Title: Video Game Market Strategy Analysis: Optimizing Genre and Platform for ROI;

Goal: To serve as an analyst for a new game studio, researching market trends to inform the optimal platform, genre, and quality benchmark for a debut title;

Deliverable: A comprehensive data story, from acquisition and database design to SQL-driven insights and final Python visualizations, presented in a Jupyter Notebook.


2. Research Objectives (Business Challenge & Hypotheses)
Business Challenge
The studio needs to determine the optimal platform-genre combination and the necessary quality benchmark (Critic Score) to prioritize for its debut title, ensuring it achieves maximum global sales and critical reception.
Hypotheses to be Tested
Hypothesis 1 (Success Metric Correlation):
"There is a stronger positive correlation between a game's average 'Critic Score' and its 'Global Sales' than between its 'User Score' and 'Global Sales'."
Hypothesis 2 (Regional Profitability & Investment):
"The 'Action' and 'Role-Playing' genres show the highest average sales in the Japan region compared to North America, suggesting a higher regional ROI for those genres that would influence localization budget decisions."

3. Data Sources and Acquisition
This section meets the requirement of using a minimum of two distinct sources.

Source;
Data Type;
Purpose in Project;

Source 1 (Primary): CSV (Kaggle): Core dataset providing Sales (Regional/Global), Genre, Platform, Publisher, Developer, Critic Score, and User Score.

Source 2 (Secondary/Enrichment): API or Web Scraping (e.g., Giant Bomb): To enrich the Publishers and Developers tables with additional data, such as Founding Year or Headquarters Location.


4. Database Structure Plan (ERD Concept)
The data will be normalized into at least three tables to facilitate complex analysis using SQL JOINs.
Tables:
Developers
Publishers
Games (The central fact/main table, linked via Foreign Keys)