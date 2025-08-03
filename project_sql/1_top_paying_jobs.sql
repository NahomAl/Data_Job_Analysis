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

/*
This query retrieves the top 20 highest-paying data-related jobs that are available remotely,
 focusing on job postings with specified salaries. It includes the company names associated with these roles,
 providing valuable insights into high-paying opportunities for Data professionals.
The results will show the job ID, job title, company name, and annual salary formatted as a currency value.
The output will look like this:
[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "company_name": "Mantys",
    "anual_salary": "$   650,000"
  },
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "company_name": "Selby Jennings",
    "anual_salary": "$   550,000"
  },
  {
    "job_id": 1714768,
    "job_title": "Staff Data Scientist - Business Analytics",
    "company_name": "Selby Jennings",
    "anual_salary": "$   525,000"
  },
  {
    "job_id": 327496,
    "job_title": "Senior Data Scientist",
    "company_name": "Glocomms",
    "anual_salary": "$   475,000"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "company_name": "Algo Capital Group",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "company_name": "Algo Capital Group",
    "anual_salary": "$   375,000"
  },
  {
    "job_id": 1742633,
    "job_title": "Head of Data Science",
    "company_name": "Demandbase",
    "anual_salary": "$   351,500"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "company_name": "Meta",
    "anual_salary": "$   336,500"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "anual_salary": "$   325,000"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "anual_salary": "$   325,000"
  },
  {
    "job_id": 551497,
    "job_title": "Head of Data Science",
    "company_name": "Demandbase",
    "anual_salary": "$   324,000"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "company_name": "Teramind",
    "anual_salary": "$   320,000"
  },
  {
    "job_id": 488169,
    "job_title": "Senior Director Data Science & ML",
    "company_name": "Life Science People",
    "anual_salary": "$   315,000"
  },
  {
    "job_id": 1161630,
    "job_title": "Director of Data Science & Analytics",
    "company_name": "Reddit",
    "anual_salary": "$   313,000"
  },
  {
    "job_id": 1080763,
    "job_title": "Sr. Director - Data Science",
    "company_name": "Indeed",
    "anual_salary": "$   310,000"
  },
  {
    "job_id": 91852,
    "job_title": "Senior Data Scientist",
    "company_name": "Top Artificial Intelligence Company",
    "anual_salary": "$   300,000"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "company_name": "Durlston Partners",
    "anual_salary": "$   300,000"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "company_name": "Storm5",
    "anual_salary": "$   300,000"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "company_name": "Walmart",
    "anual_salary": "$   300,000"
  },
  {
    "job_id": 129924,
    "job_title": "Director of Data Science",
    "company_name": "Storm4",
    "anual_salary": "$   300,000"
  }
]
*/