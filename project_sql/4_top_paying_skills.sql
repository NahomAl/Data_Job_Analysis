/*
What are the top skills based on salary?
- Look at the average salary associated with each skill for Data rols positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills_dim.skills,
    COUNT(DISTINCT job_postings_fact.job_id) AS job_count,
    TO_CHAR(AVG(job_postings_fact.salary_year_avg), '$9,999,999') AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short LIKE '%Data%' AND job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id, skills_dim.skills
ORDER BY average_salary DESC
LIMIT 10;

/*
This query retrieves the top skills based on average salary for Data roles, focusing on job postings with specified salaries.
It counts the number of job postings for each skill and calculates the average salary associated with those skills.
The results will show the skill name, total job count, and average salary formatted as a currency value.
The output will look like this:
[
  {
    "skills": "ringcentral",
    "job_count": "2",
    "average_salary": "$   182,500"
  },
  {
    "skills": "mongo",
    "job_count": "257",
    "average_salary": "$   171,361"
  },
  {
    "skills": "lua",
    "job_count": "1",
    "average_salary": "$   170,500"
  },
  {
    "skills": "solidity",
    "job_count": "8",
    "average_salary": "$   168,300"
  },
  {
    "skills": "objective-c",
    "job_count": "1",
    "average_salary": "$   164,500"
  },
  {
    "skills": "node",
    "job_count": "54",
    "average_salary": "$   161,450"
  },
  {
    "skills": "dplyr",
    "job_count": "19",
    "average_salary": "$   160,667"
  },
  {
    "skills": "watson",
    "job_count": "30",
    "average_salary": "$   155,779"
  },
  {
    "skills": "cassandra",
    "job_count": "511",
    "average_salary": "$   155,068"
  },
  {
    "skills": "hugging face",
    "job_count": "31",
    "average_salary": "$   152,537"
  }
]
*/