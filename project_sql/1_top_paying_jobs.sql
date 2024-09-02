/*
Question: What are the top-paying Data Engineer jobs?
- Identify the top 10 highest-paying Data Engineer roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Engineer, offering insights into employment options and location flexibility.
*/
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

/*
Here's the breakdown of the top data engineer jobs in 2023:
Wide Salary Range: Top 10 paying data analyst roles span from $242,000 to $325,000, indicating significant salary potential in the field.
Diverse Employers: Companies like Engtal, Signify Technology and Meta are among those offering high salaries, showing a broad interest across different industries.
Job Title Variety: There's a high diversity in job titles, from Data Engineer to Director of Engineering, reflecting varied roles and specializations within data engineering.

RESULTS
=======
[
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-02-17 18:11:49",
    "company_name": "Engtal"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-01-27 18:10:51",
    "company_name": "Engtal"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-07-17 11:10:55",
    "company_name": "Durlston Partners"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "251000.0",
    "job_posted_date": "2023-01-30 11:07:32",
    "company_name": "Twitch"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-02-14 15:24:07",
    "company_name": "Signify Technology"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-03-24 23:32:42",
    "company_name": "AI Startup"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-03-28 13:11:42",
    "company_name": "Signify Technology"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "245000.0",
    "job_posted_date": "2023-05-25 15:05:38",
    "company_name": "Movable Ink"
  },
  {
    "job_id": 204320,
    "job_title": "Staff Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "245000.0",
    "job_posted_date": "2023-01-08 15:05:16",
    "company_name": "Handshake"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "242000.0",
    "job_posted_date": "2023-12-12 15:56:17",
    "company_name": "Meta"
  }
]
*/
