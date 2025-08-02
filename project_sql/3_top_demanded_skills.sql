/*
What are the most in-demand skills for data jobs?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/
WITH skill_demand AS (
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
)

SELECT 
    skills,
    job_count,
    data_analyst_count,
    data_scientist_count,
    data_engineer_count
FROM skill_demand
ORDER BY job_count DESC
LIMIT 10;