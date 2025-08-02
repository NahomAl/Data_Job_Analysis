/*
 What are the top-paying data related jobs?
 - Identifying the top 20 highest-paying Data roles that are available remotely
 - Focuses on job postings with specified salaries (remove nulls)
 - Include company names of top 20 roles
 - Why? Highlight the top-paying opportunities for Data professionals, offering insights into employment options and location flexibility.
 */
SELECT job_id,
    job_title,
    company_dim.name AS company_name,
    TO_CHAR(salary_year_avg, '$9,999,999') AS anual_salary
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short LIKE '%Data%'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY anual_salary DESC
LIMIT 20;