# Data Cleaning SQL Project

## Project Overview

**Project Title**: Data Cleaning in SQL\
**Date**: 2025-02-16\
**Database**: `data_cleaning_db`

This project demonstrates SQL skills used for **data cleaning**, ensuring data integrity, consistency, and accuracy. It involves handling missing values, removing duplicates, standardizing formats, and correcting incorrect data entries.

---

## Objectives

1. **Set up a database and import raw data**
2. **Handle missing values**
3. **Remove duplicate records**
4. **Standardize data formats**
5. **Correct inaccurate data**

---

## Project Structure

### **1. Database Setup**

```sql
CREATE DATABASE IF NOT EXISTS data_cleaning_db;
USE data_cleaning_db;
```

---

### **2. Data Cleaning Steps**

#### **Check for Missing Values**

```sql
SELECT * FROM table_name
WHERE column1 IS NULL OR column2 IS NULL OR column3 IS NULL;
```

#### **Remove Duplicate Records**

```sql
DELETE FROM table_name
WHERE id NOT IN (
    SELECT MIN(id) FROM table_name GROUP BY column1, column2, column3
);
```

#### **Standardize Text Formats**

```sql
UPDATE table_name
SET column_name = TRIM(LOWER(column_name));
```

#### **Correct Inaccurate Data Entries**

```sql
UPDATE table_name
SET column_name = 'Correct Value'
WHERE column_name = 'Incorrect Value';
```

#### **Check for Outliers in Numeric Data**

```sql
SELECT * FROM table_name
WHERE column_name > (SELECT AVG(column_name) + 3 * STDDEV(column_name) FROM table_name);
```

---

## **Findings & Insights**

- Identified and handled missing values.
- Removed duplicate records to ensure data consistency.
- Standardized text formats for uniformity.
- Fixed incorrect data entries.
- Checked for outliers to improve data accuracy.

---

## **How to Use This Project**

1. **Clone the Repository**: If this is on GitHub, clone or download the SQL file.
2. **Set Up the Database**: Run the database setup queries.
3. **Import Data**: Load your dataset into the respective table.
4. **Run Cleaning Queries**: Execute the provided SQL queries to clean and standardize the data.

---

## **Author & Portfolio**

This project is part of my portfolio to demonstrate SQL data cleaning skills. If you have questions or feedback, feel free to connect with me!

🚀 **Thank you for exploring my SQL project!** 🚀

