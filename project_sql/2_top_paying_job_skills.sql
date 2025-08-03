/*
What skills are required for the top-paying data related jobs?
- Use the top 20 highest-paying Data roles from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_data_jobs AS (
    SELECT job_id,
        job_title,
        company_dim.name AS company_name,
        salary_year_avg AS anual_salary
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short LIKE '%Data%'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY anual_salary DESC
    LIMIT 20
)

SELECT 
    tp.job_id,
    tp.job_title,
    tp.company_name,
    skills_dim.skills,
    TO_CHAR(tp.anual_salary, '$9,999,999') AS anual_salary
FROM top_paying_data_jobs tp

INNER JOIN skills_job_dim ON tp.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

ORDER BY 
    tp.anual_salary DESC
LIMIT 20;

/*
This query retrieves the top 20 highest-paying data-related jobs that are available remotely,
 focusing on job postings with specified salaries. It includes the company names associated with these roles,
 as well as the specific skills required for these positions, providing valuable insights into high-paying opportunities for Data professionals.
The results will show the job ID, job title, company name, skills required, and annual salary formatted as a currency value.
The output will look like this:
[
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "company_name": "Selby Jennings",
    "skills": "sql",
    "anual_salary": "$   550,000"
  },
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "company_name": "Selby Jennings",
    "skills": "python",
    "anual_salary": "$   550,000"
  },
  {
    "job_id": 1714768,
    "job_title": "Staff Data Scientist - Business Analytics",
    "company_name": "Selby Jennings",
    "skills": "sql",
    "anual_salary": "$   525,000"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "sql",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "python",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "java",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "c++",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "cassandra",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "spark",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "hadoop",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "tableau",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "sql",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "python",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "java",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "cassandra",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "spark",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "hadoop",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "company_name": "Algo Capital Group",
    "skills": "tableau",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "skills": "python",
    "anual_salary": "$   325,000"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "skills": "spark",
    "anual_salary": "$   325,000"
  }
]
*/