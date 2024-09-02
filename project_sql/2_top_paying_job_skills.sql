/*
Question: What skills are required for the top-paying data engineer jobs?
- Use the top 10 highest-paying Data Engineer jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Engineer' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL    
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC

/* Here's the breakdown of the most demanded skills for data engineers in 2023, based on job postings:

Python is leading with a bold count of 7.
Spark follows with a bold count of 5.
Skills like Hadoop, Kafka, and Scala are also in demand, each with a bold count of 3.
Other skills such as Pandas, Numpy, and Pyspark show varying degrees of demand, indicating a diverse skill set requirement for data engineering roles.

[
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-02-17 18:11:49",
    "company_name": "Engtal",
    "skills": "python"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-02-17 18:11:49",
    "company_name": "Engtal",
    "skills": "spark"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-02-17 18:11:49",
    "company_name": "Engtal",
    "skills": "pandas"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-02-17 18:11:49",
    "company_name": "Engtal",
    "skills": "numpy"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-02-17 18:11:49",
    "company_name": "Engtal",
    "skills": "pyspark"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-02-17 18:11:49",
    "company_name": "Engtal",
    "skills": "hadoop"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-02-17 18:11:49",
    "company_name": "Engtal",
    "skills": "kafka"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-02-17 18:11:49",
    "company_name": "Engtal",
    "skills": "kubernetes"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-01-27 18:10:51",
    "company_name": "Engtal",
    "skills": "python"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-01-27 18:10:51",
    "company_name": "Engtal",
    "skills": "spark"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-01-27 18:10:51",
    "company_name": "Engtal",
    "skills": "pandas"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-01-27 18:10:51",
    "company_name": "Engtal",
    "skills": "numpy"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-01-27 18:10:51",
    "company_name": "Engtal",
    "skills": "pyspark"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-01-27 18:10:51",
    "company_name": "Engtal",
    "skills": "hadoop"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-01-27 18:10:51",
    "company_name": "Engtal",
    "skills": "kafka"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-01-27 18:10:51",
    "company_name": "Engtal",
    "skills": "kubernetes"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-07-17 11:10:55",
    "company_name": "Durlston Partners",
    "skills": "sql"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-07-17 11:10:55",
    "company_name": "Durlston Partners",
    "skills": "python"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "251000.0",
    "job_posted_date": "2023-01-30 11:07:32",
    "company_name": "Twitch",
    "skills": "spark"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "251000.0",
    "job_posted_date": "2023-01-30 11:07:32",
    "company_name": "Twitch",
    "skills": "hadoop"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "251000.0",
    "job_posted_date": "2023-01-30 11:07:32",
    "company_name": "Twitch",
    "skills": "kafka"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "251000.0",
    "job_posted_date": "2023-01-30 11:07:32",
    "company_name": "Twitch",
    "skills": "tensorflow"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "251000.0",
    "job_posted_date": "2023-01-30 11:07:32",
    "company_name": "Twitch",
    "skills": "keras"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "251000.0",
    "job_posted_date": "2023-01-30 11:07:32",
    "company_name": "Twitch",
    "skills": "pytorch"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-02-14 15:24:07",
    "company_name": "Signify Technology",
    "skills": "python"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-02-14 15:24:07",
    "company_name": "Signify Technology",
    "skills": "scala"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-02-14 15:24:07",
    "company_name": "Signify Technology",
    "skills": "databricks"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-02-14 15:24:07",
    "company_name": "Signify Technology",
    "skills": "spark"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-03-28 13:11:42",
    "company_name": "Signify Technology",
    "skills": "python"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-03-28 13:11:42",
    "company_name": "Signify Technology",
    "skills": "scala"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-03-28 13:11:42",
    "company_name": "Signify Technology",
    "skills": "databricks"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-03-28 13:11:42",
    "company_name": "Signify Technology",
    "skills": "spark"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-03-24 23:32:42",
    "company_name": "AI Startup",
    "skills": "python"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-03-24 23:32:42",
    "company_name": "AI Startup",
    "skills": "scala"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-03-24 23:32:42",
    "company_name": "AI Startup",
    "skills": "r"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-03-24 23:32:42",
    "company_name": "AI Startup",
    "skills": "azure"
  },
  {
    "job_id": 204320,
    "job_title": "Staff Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "245000.0",
    "job_posted_date": "2023-01-08 15:05:16",
    "company_name": "Handshake",
    "skills": "go"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "245000.0",
    "job_posted_date": "2023-05-25 15:05:38",
    "company_name": "Movable Ink",
    "skills": "nosql"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "245000.0",
    "job_posted_date": "2023-05-25 15:05:38",
    "company_name": "Movable Ink",
    "skills": "aws"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "245000.0",
    "job_posted_date": "2023-05-25 15:05:38",
    "company_name": "Movable Ink",
    "skills": "gcp"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "242000.0",
    "job_posted_date": "2023-12-12 15:56:17",
    "company_name": "Meta",
    "skills": "sql"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "242000.0",
    "job_posted_date": "2023-12-12 15:56:17",
    "company_name": "Meta",
    "skills": "python"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "242000.0",
    "job_posted_date": "2023-12-12 15:56:17",
    "company_name": "Meta",
    "skills": "java"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "242000.0",
    "job_posted_date": "2023-12-12 15:56:17",
    "company_name": "Meta",
    "skills": "perl"
  }
]
*/
