![Data Analyst Job Market](/images/job.jpg)
# 📊 Exploring the Data Analyst Job Market with SQL  

## **Introduction**  
The demand for **data analysts** is growing rapidly, but what skills truly matter in the job market? This project explores **top-paying data analyst jobs, the most in-demand skills, and salary trends** to help professionals make **data-driven career decisions**.  

🔍 **Key Focus Areas:**  
- **Top-paying jobs** in data analytics  
- **Most in-demand skills** for data analysts  
- **Skills associated with higher salaries**  
- **Optimal skills to learn for career growth**  

📂 **SQL Queries & Analysis:** Find all queries in the [project_sql folder](/project_files/).  

---

## **📌 Project Motivation**  
As an aspiring data analyst, I wanted to understand:  
✅ **What skills are most valuable in the job market?**  
✅ **Which skills can lead to higher salaries?**  
✅ **How can job seekers optimize their career paths?**  

By analyzing job postings using **SQL**, I extracted insights that provide a clear **roadmap for aspiring and experienced data professionals**.  

---

## **📊 Dataset & Tools Used**  

This project is based on a **real-world job posting dataset** containing:  
- **Job Titles** (e.g., Data Analyst, BI Analyst, Data Scientist)  
- **Salaries** (Average yearly pay)  
- **Locations** (Remote vs. On-site)  
- **Required Skills** (SQL, Python, Tableau, etc.)  
- **Job Posting Date**  

### **🛠 Tools Used:**  
| Tool            | Purpose |  
|----------------|-----------------------------------------------------|  
| **SQL**        | Querying and extracting insights from job data  |  
| **PostgreSQL** | Database management system for structured queries  |  
| **VS Code**    | Writing and executing SQL queries  |  
| **GitHub**     | Version control and sharing project findings  |  

---

## **🔍 Key SQL Queries & Analysis**  

### **1️⃣ Top-Paying Data Analyst Jobs**  

💰 **Finding the highest-paying data analyst jobs** with a **remote work** filter:  

```sql
SELECT 
    job_id, job_title, job_location, salary_year_avg, job_posted_date, name AS company_name
FROM 
    job_postings_fact
LEFT JOIN 
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND job_location = 'Anywhere' 
    AND salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;
```
## 📈 Insights  

- **Top salaries range from** `$184,000` **to** `$650,000`!  
- **Companies like Meta, AT&T, and SmartAsset** offer high-paying analyst roles.  
- **Remote opportunities are available** for high-paying jobs.  

---

## 2️⃣ Skills Required for High-Paying Jobs  

🚀 **What skills do high-paying jobs require?**  
```sql
WITH top_paying_jobs AS (
    SELECT job_id, job_title, salary_year_avg, name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' 
        AND job_location = 'Anywhere' 
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*, skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;
```
## 📊 Top Skills for High-Paying Jobs  

| **Skill**     | **Occurrence** |
|--------------|--------------|
| SQL         | 8            |
| Python      | 7            |
| Tableau     | 6            |
| R           | 5            |
| Snowflake   | 4            |

✅ **SQL is the most required skill for top-paying data analyst jobs.**  
✅ **Python & Tableau are also highly valued in high-salary roles.**  

---

## 3️⃣ Most In-Demand Skills for Data Analysts  

🔥 **What skills appear most frequently in job postings?**  

```sql
SELECT 
    skills, COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' 
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;
```
### 📊 Top 5 Most In-Demand Skills  

| **Skill**   | **Demand Count** |  
|-------------|------------------|  
| SQL         | 7,291            |  
| Excel       | 4,611            |  
| Python      | 4,330            |  
| Tableau     | 3,745            |  
| Power BI    | 2,609            |  

✅ **SQL & Excel** remain fundamental for data analysis.  
✅ **Python** and visualization tools like **Tableau** and **Power BI** are essential for modern data analysts.  

---

### 4️⃣ Skills with the Highest Salaries  

💰 **Which skills are linked to higher salaries?**
```sql
SELECT 
    skills, ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 10;
```  
### 📈 Top Paying Skills in 2023  

| **Skill**     | **Average Salary ($)** |  
|---------------|------------------------|  
| PySpark       | 208,172                |  
| Hadoop        | 160,515                |  
| Snowflake     | 155,486                |  
| Kubernetes    | 154,500                |  
| Jupyter       | 152,777                |  

✅ **Big Data & Cloud skills** (e.g., PySpark, Hadoop, Snowflake) command high salaries.  
✅ **Data Engineering tools** (e.g., Kubernetes, Jupyter) are also lucrative.  
## 🚀 Key Takeaways  

1️⃣ **Top-paying jobs** offer salaries up to **$650,000**!  
2️⃣ **SQL** is the **#1 most required skill** for data analyst roles.  
3️⃣ **Python, Tableau, and Power BI** are essential technical skills.  
4️⃣ **Cloud & Big Data skills** (e.g., PySpark, Snowflake) lead to **higher salaries**.  
5️⃣ **Optimizing your skillset** with high-demand, high-paying skills can boost career growth.  

---

## 📌 What I Learned  

- 🛠 **Advanced SQL Queries:** Using **CTEs, Joins, and Aggregations** for real-world analysis.  
- 📊 **Data-Driven Career Insights:** Understanding **job market trends** through SQL.  
- 🚀 **Optimizing Career Paths:** Identifying **high-value skills** for long-term success.  

---

## 🎯 Final Thoughts  

This project provided valuable insights into the **job market for data analysts**, helping professionals make **informed career choices**. By leveraging **SQL for job market analysis**, we can prioritize learning **high-value skills** to stay competitive.  

🔎 Explore the full SQL queries and insights in the [project_sql folder](/project_files/).  




