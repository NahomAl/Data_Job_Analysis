# Introduction
📊 Dive into the data job market! Focusing on data roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

🔍 **SQL queries?** Check them out here: [project_sql folder](/project_sql/)

📁 **Dataset?** Available in the [csv_files folder](/csv_files/)


# Background

Driven by a quest to navigate the data job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others' work to find optimal jobs.

### 📌 The questions I wanted to answer through my SQL queries were:
1. What are the top-paying data-related jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data professionals?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.


# The Analysis

Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

---

## 💰 1. What are the top-paying data-related jobs?

**Goal:**  
Identify the top 20 highest-paying data jobs that are remote, include salary info, and company names.

**SQL Highlights:**  
- Filter for roles with `"Data"` in the title.
- Focus on `job_location = 'Anywhere'`.
- Remove jobs with `NULL` salaries.
- Sort by `salary_year_avg`.

**Sample Output:**

| Job Title                             | Company Name           | Annual Salary |
|--------------------------------------|------------------------|---------------|
| Staff Data Scientist/Quant Researcher| Selby Jennings         | $550,000      |
| Staff Data Scientist - Business Analytics | Selby Jennings   | $525,000      |
| Senior Data Scientist                | Glocomms               | $475,000      |
| Director of Analytics                | Meta                   | $336,500      |


## 🛠️ 2. What skills are required for these top-paying jobs?

**Goal:**  
Reveal which skills are needed for the top 20 highest-paying roles identified above.

**SQL Highlights:**  
- Use a CTE to isolate top 20 remote, high-paying jobs.
- Join with skills data to list required skills for each role.

**Sample Output:**

| Job Title         | Company Name     | Skill      | Salary     |
|------------------|------------------|------------|------------|
| Senior Data Scientist | Algo Capital Group | Python     | $375,000   |
| Senior Data Scientist | Algo Capital Group | Spark      | $375,000   |
| Data Engineer     | Engtal           | Python     | $325,000   |
| Data Scientist    | Algo Capital Group | Cassandra | $375,000   |


## 📈 3. What are the most in-demand skills for data jobs?

**Goal:**  
Find the top 10 most requested skills across all data job types.

**SQL Highlights:**  
- Count skill occurrences across roles like Data Analyst, Scientist, and Engineer.
- Use `CASE` to break counts by role.

**Sample Output:**

| Skill     | Total Jobs | Analysts | Scientists | Engineers |
|-----------|------------|----------|------------|-----------|
| SQL       | 350,277    | 110,380  | 97,835     | 142,062   |
| Python    | 345,666    | 68,409   | 140,012    | 137,245   |
| Excel     | 106,231    | 75,348   | 20,886     | 9,997     |


## 💸 4. Which skills are associated with higher salaries?

**Goal:**  
Find which individual skills are linked to the highest average salaries.

**SQL Highlights:**  
- Filter roles with salary info.
- Group by skill and average salary.

**Sample Output:**

| Skill       | Job Count | Avg Salary |
|-------------|-----------|------------|
| RingCentral | 2         | $182,500   |
| MongoDB     | 257       | $171,361   |
| Solidity    | 8         | $168,300   |
| Node.js     | 54        | $161,450   |


## 🎯 5. What are the most optimal skills to learn?

**Goal:**  
Identify skills that are both **in high demand** and **associated with high pay**.

**SQL Highlights:**  
- CTEs for high-demand and high-pay skills.
- Inner join on `skills`.

**Sample Output:**

| Skill     | Job Count | Avg Salary |
|-----------|-----------|------------|
| Python    | 345,666   | $133,137   |
| Spark     | 107,311   | $142,458   |
| Java      | 71,278    | $137,494   |
| AWS       | 126,554   | $137,478   |


## 📂 SQL Queries & Dataset

- 📁 [View All SQL Queries](/project_sql/)
- 📊 [Explore Dataset CSVs](/csv_files/)
