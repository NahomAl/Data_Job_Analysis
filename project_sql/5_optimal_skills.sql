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
ORDER BY high_demand_skills.job_count DESC, high_paying_skills.average_salary DESC
LIMIT 10;
