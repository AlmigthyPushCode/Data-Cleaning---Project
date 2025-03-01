# Layoffs Data Analysis SQL Project

## Project Overview

**Project Title**: Layoffs Data Analysis  
**Database**: `layoffs_db`  

This project analyzes **layoff trends** across different companies, industries, and countries using SQL. The dataset provides insights into the scale and timing of layoffs, helping identify key patterns.

---

## Objectives

1. **Explore layoffs data** to identify trends across industries and countries.  
2. **Analyze company-wise and industry-wise layoffs** to determine the most affected sectors.  
3. **Examine yearly and monthly trends** to observe layoff peaks.  
4. **Use SQL for data aggregation and reporting** to derive meaningful insights.  

---

## Project Structure

### **1. Data Exploration**

#### **View Full Dataset**
```sql
SELECT * FROM layoffs_stagging2;
```

#### **Find Maximum Layoffs and Percentage Laid Off**
```sql
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_stagging2;
```

#### **Companies with 100% Layoffs (Shutdowns)**
```sql
SELECT * FROM layoffs_stagging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;
```

#### **Total Layoffs by Company**
```sql
SELECT company, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY company
ORDER BY 2 DESC;
```

#### **Date Range of Layoffs Data**
```sql
SELECT MIN(date), MAX(date)
FROM layoffs_stagging2;
```

---

### **2. Industry & Country-Level Analysis**

#### **Total Layoffs by Industry**
```sql
SELECT industry, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY industry
ORDER BY 2 DESC;
```

#### **Total Layoffs by Country**
```sql
SELECT country, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY country
ORDER BY 2 DESC;
```

---

### **3. Yearly & Monthly Trends**

#### **Total Layoffs Per Year**
```sql
SELECT YEAR(date), SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY YEAR(date)
ORDER BY 2 DESC;
```

#### **Layoffs by Business Stage**
```sql
SELECT stage, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY stage
ORDER BY 2 DESC;
```

#### **Monthly Layoff Trends**
```sql
SELECT SUBSTR(date,1,7) AS month, SUM(total_laid_off)
FROM layoffs_stagging2
WHERE SUBSTR(date,1,7) IS NOT NULL
GROUP BY SUBSTR(date,1,7)
ORDER BY 1 ASC;
```

---

### **4. Rolling Total Analysis**

#### **Cumulative Layoffs Over Time**
```sql
WITH rolling_total AS (
    SELECT SUBSTR(date,1,7) AS month,
           SUM(total_laid_off) OVER (ORDER BY SUBSTR(date,1,7) ASC) AS cumulative_layoffs
    FROM layoffs_stagging2
    WHERE SUBSTR(date,1,7) IS NOT NULL
)
SELECT * FROM rolling_total;
```

---

## **Findings & Insights**

- Certain **industries and companies** were more affected than others.
- Layoffs **peaked in specific years and months**, indicating economic downturns.
- Some companies had **100% layoffs**, signaling shutdowns.
- The rolling total analysis shows **cumulative layoffs trends** over time.

---

## **How to Use This Project**

1. **Clone the Repository**: If this is on GitHub, clone or download the SQL file.
2. **Set Up the Database**: Run the queries using your SQL environment.
3. **Import Data**: Load the layoff dataset into `layoffs_stagging2`.
4. **Run Queries**: Execute the provided SQL queries to analyze layoffs trends.

---

## **Author & Portfolio**

This project is part of my portfolio to demonstrate SQL skills in data analysis. If you have questions or feedback, feel free to connect with me!

### 📌 Stay Connected:
- **LinkedIn**: [www.linkedin.com/in/joshua-n-a28005216e](#)
- **Email**: [joshuajos999@gmail.com](#)

🚀 **Thank you for exploring my SQL project!** 🚀


