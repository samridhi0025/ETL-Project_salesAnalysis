# End-to-End ETL Project using Python, SQL Server & Kaggle API
![Python](https://img.shields.io/badge/Python-3.9-blue)
![SQL Server](https://img.shields.io/badge/SQL%20Server-ETL-blue)
![Status](https://img.shields.io/badge/Project%20Status-Completed-brightgreen)

This project demonstrates a complete **ETL (Extract, Transform, Load)** pipeline built using **Python and SQL Server**, showcasing data engineering and analytics capabilities. We automate data extraction from **Kaggle**, clean and transform it using **Pandas**, load it into **SQL Server**, and finally run **SQL queries** to derive business insights.

---

## 📌 Project Overview

- **Extract**: Fetch dataset from Kaggle using the Kaggle API.
- **Transform**: Clean and process the data using Pandas (handling missing values, formatting, column renaming).
- **Load**: Insert the cleaned data into a Microsoft SQL Server database.
- **Analyze**: Use SQL queries to answer business questions from the loaded data.

---

## 🧰 Tools & Technologies Used

- **Python** (Jupyter Notebook)
- **Pandas**
- **Kaggle API**
- **SQL Server**
- **SQLAlchemy**

---

## 🚀 Steps Performed

1. **Kaggle API Setup**  
   - Installed and authenticated the Kaggle API  
   - Programmatically downloaded the dataset

2. **Data Cleaning with Pandas**  
   - Dropped nulls and unnecessary columns  
   - Renamed columns for clarity  
   - Converted data types

3. **Database Setup & Connection**  
   - Created a new database in **SQL Server**  
   - Used `SQLAlchemy` to connect  
   - Created SQL tables and inserted cleaned data

4. **Data Analysis with SQL**  
   - Answered real-world questions like:
     - Total revenue
     - Best-selling products
     - Monthly sales trends
     - Average discount per order

---

##  How to Run This Project

1. Install dependencies from `requirements.txt`
2. Setup your SQL Server and create a new DB
3. Download the dataset using the Kaggle API (`kaggle datasets download`)
4. Run the ETL script / notebook
5. Open SSMS and query the database

---

## 📌 Note

This project is inspired by real-world ETL practices and structured for easy understanding and reuse. Feel free to fork or suggest improvements!
