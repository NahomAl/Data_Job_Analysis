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
        job_country,
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
    tp.*,
    skills_dim.skills
FROM top_paying_data_jobs tp

INNER JOIN skills_job_dim ON tp.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

ORDER BY 
    tp.anual_salary DESC
LIMIT 20;