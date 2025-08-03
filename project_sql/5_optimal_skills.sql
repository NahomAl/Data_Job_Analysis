/*
What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/
WITH 
    high_demand_skills AS (
         SELECT
            skills_dim.skill_id,
            skills_dim.skills,
            COUNT(DISTINCT job_postings_fact.job_id) AS job_count,
            COUNT(DISTINCT CASE 
                WHEN job_postings_fact.job_title_short LIKE '%Data Analyst%' THEN job_postings_fact.job_id 
            END) AS data_analyst_count,
            COUNT(DISTINCT CASE 
                WHEN job_postings_fact.job_title_short LIKE '%Data Scientist%' THEN job_postings_fact.job_id 
            END) AS data_scientist_count,
            COUNT(DISTINCT CASE 
                WHEN job_postings_fact.job_title_short LIKE '%Data Engineer%' THEN job_postings_fact.job_id 
            END) AS data_engineer_count
        FROM job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
        WHERE job_postings_fact.job_title_short LIKE '%Data%'
        GROUP BY skills_dim.skill_id, skills_dim.skills
        ORDER BY job_count DESC
    ),
    high_paying_skills AS (
        SELECT
        skills_dim.skills,
        TO_CHAR(AVG(job_postings_fact.salary_year_avg), '$9,999,999') AS average_salary
        FROM job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
        WHERE job_postings_fact.job_title_short LIKE '%Data%' AND job_postings_fact.salary_year_avg IS NOT NULL
        GROUP BY skills_dim.skill_id, skills_dim.skills
        ORDER BY average_salary DESC
    )

SELECT
    high_demand_skills.skills,
    high_demand_skills.job_count,
    high_paying_skills.average_salary
FROM high_demand_skills
INNER JOIN high_paying_skills ON high_demand_skills.skills = high_paying_skills.skills
LIMIT 10;

/*
This query retrieves the top 10 skills that are both in high demand and associated with high average salaries for Data roles.
It combines the demand for skills (number of job postings) with the average salary for those skills
and focuses on remote positions with specified salaries.
The results will show the skill name, total job count, and average salary formatted as a currency
value.
The output will look like this:
[
  {
    "skills": "sql",
    "job_count": "350277",
    "average_salary": "$   125,844"
  },
  {
    "skills": "python",
    "job_count": "345666",
    "average_salary": "$   133,137"
  },
  {
    "skills": "aws",
    "job_count": "126554",
    "average_salary": "$   137,478"
  },
  {
    "skills": "r",
    "job_count": "124064",
    "average_salary": "$   127,585"
  },
  {
    "skills": "azure",
    "job_count": "117502",
    "average_salary": "$   131,486"
  },
  {
    "skills": "tableau",
    "job_count": "115560",
    "average_salary": "$   117,769"
  },
  {
    "skills": "spark",
    "job_count": "107311",
    "average_salary": "$   142,458"
  },
  {
    "skills": "excel",
    "job_count": "106231",
    "average_salary": "$   100,124"
  },
  {
    "skills": "power bi",
    "job_count": "87060",
    "average_salary": "$   107,897"
  },
  {
    "skills": "java",
    "job_count": "71278",
    "average_salary": "$   137,494"
  }
]
*/