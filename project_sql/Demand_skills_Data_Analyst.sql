WITH demand_skills AS (
SELECT  
    skill_id ,
    COUNT(*) AS  skill_count     
FROM skills_job_dim
INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE
    job_postings_fact.job_work_from_home = true AND
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY
    skill_id
)

SELECT
    skills_dim.skill_id,
    skills,
    skill_count
FROM demand_skills
INNER JOIN skills_dim ON skills_dim.skill_id = demand_skills.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;
