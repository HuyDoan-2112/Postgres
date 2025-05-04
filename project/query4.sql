

SELECT 
    skills.skills,
    ROUND(AVG (salary_year_avg), 2)AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim AS id ON id.job_id = job_postings_fact.job_id
INNER JOIN skills_dim AS skills ON skills.skill_id = id.skill_id
WHERE  
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25

/*
1. Big Data & Distributed Computing Are King
Top skill: PySpark ($208k+) is a leading tool for processing large-scale data.

Other tools like Databricks, Couchbase, and Elasticsearch reflect the need for handling massive, distributed, and often real-time datasets.

✅ Trend: Data analysts with big data engineering capabilities earn significantly more.

2. Version Control & DevOps Integration
Bitbucket, GitLab, Jenkins, Atlassian tools are well-represented.

Indicates growing demand for data analysts working in CI/CD environments, collaborating on codebases.

✅ Trend: Employers value analysts who can fit into software/devops-style workflows.

3. ML & AI Skillsets Pay Well
Watson, DataRobot, Scikit-learn, Jupyter, Pandas, NumPy – all signal demand for machine learning and AI-fluent analysts.

These roles likely blend data science and automated modeling capabilities.

✅ Trend: ML-enabled analysts bridge the gap between data science and data analysis.

4. Programming Beyond Python
Swift, Golang, and Scala are programming languages not traditionally core to data analysis.

But appearing here suggests hybrid roles—analyst-engineer or analyst-product developer.

✅ Trend: Coding-heavy analysts with broader language skills command higher salaries.

5. Cloud & Orchestration Tools
Tools like Airflow (data pipeline orchestration), GCP (cloud platform), Kubernetes (container orchestration) show up.

Points to the importance of automated, scalable data pipelines and cloud-first architecture knowledge.

✅ Trend: Cloud-native and workflow-savvy analysts are more in demand.

6. BI and Enterprise Stack Still Relevant
MicroStrategy, PostgreSQL, and Notion represent enterprise tools and database/reporting integration.

While not flashy, these are still critical in business-facing analyst roles.

✅ Trend: Analysts who can bridge raw data with decision-making tools still earn well.


[
  {
    "skills": "pyspark",
    "average_salary": "208172.25"
  },
  {
    "skills": "bitbucket",
    "average_salary": "189154.50"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515.00"
  },
  {
    "skills": "watson",
    "average_salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "average_salary": "155485.50"
  },
  {
    "skills": "gitlab",
    "average_salary": "154500.00"
  },
  {
    "skills": "swift",
    "average_salary": "153750.00"
  },
  {
    "skills": "jupyter",
    "average_salary": "152776.50"
  },
  {
    "skills": "pandas",
    "average_salary": "151821.33"
  },
  {
    "skills": "elasticsearch",
    "average_salary": "145000.00"
  },
  {
    "skills": "golang",
    "average_salary": "145000.00"
  },
  {
    "skills": "numpy",
    "average_salary": "143512.50"
  },
  {
    "skills": "databricks",
    "average_salary": "141906.60"
  },
  {
    "skills": "linux",
    "average_salary": "136507.50"
  },
  {
    "skills": "kubernetes",
    "average_salary": "132500.00"
  },
  {
    "skills": "atlassian",
    "average_salary": "131161.80"
  },
  {
    "skills": "twilio",
    "average_salary": "127000.00"
  },
  {
    "skills": "airflow",
    "average_salary": "126103.00"
  },
  {
    "skills": "scikit-learn",
    "average_salary": "125781.25"
  },
  {
    "skills": "jenkins",
    "average_salary": "125436.33"
  },
  {
    "skills": "notion",
    "average_salary": "125000.00"
  },
  {
    "skills": "scala",
    "average_salary": "124903.00"
  },
  {
    "skills": "postgresql",
    "average_salary": "123878.75"
  },
  {
    "skills": "gcp",
    "average_salary": "122500.00"
  },
  {
    "skills": "microstrategy",
    "average_salary": "121619.25"
  }
]
*/