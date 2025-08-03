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

/*
This query retrieves the top 10 in-demand skills for data jobs, focusing on job postings that
include various data roles. It counts the number of job postings for each skill and breaks down the demand by specific data roles such as Data Analyst, Data Scientist, and Data Engineer. 
The results will show the skill name, total job count, and counts for each specific role.
The output will look like this:
[
  {
    "skills": "sql",
    "job_count": "350277",
    "data_analyst_count": "110380",
    "data_scientist_count": "97835",
    "data_engineer_count": "142062"
  },
  {
    "skills": "python",
    "job_count": "345666",
    "data_analyst_count": "68409",
    "data_scientist_count": "140012",
    "data_engineer_count": "137245"
  },
  {
    "skills": "aws",
    "job_count": "126554",
    "data_analyst_count": "11197",
    "data_scientist_count": "33779",
    "data_engineer_count": "81578"
  },
  {
    "skills": "r",
    "job_count": "124064",
    "data_analyst_count": "36327",
    "data_scientist_count": "72526",
    "data_engineer_count": "15211"
  },
  {
    "skills": "azure",
    "job_count": "117502",
    "data_analyst_count": "13221",
    "data_scientist_count": "27227",
    "data_engineer_count": "77054"
  },
  {
    "skills": "tableau",
    "job_count": "115560",
    "data_analyst_count": "56569",
    "data_scientist_count": "35472",
    "data_engineer_count": "23519"
  },
  {
    "skills": "spark",
    "job_count": "107311",
    "data_analyst_count": "6415",
    "data_scientist_count": "30991",
    "data_engineer_count": "69905"
  },
  {
    "skills": "excel",
    "job_count": "106231",
    "data_analyst_count": "75348",
    "data_scientist_count": "20886",
    "data_engineer_count": "9997"
  },
  {
    "skills": "power bi",
    "job_count": "87060",
    "data_analyst_count": "45482",
    "data_scientist_count": "18532",
    "data_engineer_count": "23046"
  },
  {
    "skills": "java",
    "job_count": "71278",
    "data_analyst_count": "6015",
    "data_scientist_count": "19449",
    "data_engineer_count": "45814"
  }
]
*/