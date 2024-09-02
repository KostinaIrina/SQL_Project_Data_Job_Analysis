/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Engineer positions
- Focuses on roles with specified salaries and located in New Zealand
- Why? It reveals how different skills impact salary levels for Data Engineer and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Engineer' AND
    job_location = 'New Zealand' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/* 
Here's a breakdown of the results for top paying skills for Data Engineers:

High Demand for Cloud and Data Tools: Top salaries are driven by expertise in cloud platforms (AWS, Azure, GCP) 
and data storage technologies (BigQuery, Redshift, Snowflake), reflecting the industry's emphasis on cloud-based data 
management and processing capabilities.

Proficiency in Big Data and Workflow Orchestration: Skills in big data technologies (Spark, Kafka, NoSQL) and workflow 
orchestration tools (Airflow, Kubernetes) command high salaries, highlighting the value placed on efficient data pipeline 
management and large-scale data processing.

Versatile Programming Skills: Expertise in programming languages like Python, Java, and Scala is highly rewarded, 
emphasizing the importance of coding versatility in building and optimizing data pipelines within modern data engineering roles.

[
  {
    "skills": "airflow",
    "avg_salary": "249000"
  },
  {
    "skills": "aws",
    "avg_salary": "249000"
  },
  {
    "skills": "azure",
    "avg_salary": "249000"
  },
  {
    "skills": "bigquery",
    "avg_salary": "249000"
  },
  {
    "skills": "docker",
    "avg_salary": "249000"
  },
  {
    "skills": "gcp",
    "avg_salary": "249000"
  },
  {
    "skills": "java",
    "avg_salary": "249000"
  },
  {
    "skills": "kafka",
    "avg_salary": "249000"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "249000"
  },
  {
    "skills": "nosql",
    "avg_salary": "249000"
  },
  {
    "skills": "python",
    "avg_salary": "249000"
  },
  {
    "skills": "redshift",
    "avg_salary": "249000"
  },
  {
    "skills": "scala",
    "avg_salary": "249000"
  },
  {
    "skills": "snowflake",
    "avg_salary": "249000"
  },
  {
    "skills": "spark",
    "avg_salary": "249000"
  }
]
*/