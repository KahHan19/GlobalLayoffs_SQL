# SQL Data Cleaning: Company Layoff Analysis (2021)

This repository explores data cleaning techniques in SQL using a dataset of company layoffs in 2021. We'll focus on duplicate removal, data standardization, handling null values, and identifying redundant rows/columns.


## Dataset: Company Layoffs (2021)

Source: [AlexTheAnalyst's MySQL YouTube Series](https://github.com/AlexTheAnalyst/MySQL-YouTube-Series)

This dataset contains information about company layoffs around the world in 2021. It includes columns for:

* `company` (text)
* `location` (text)
* `industry` (text)
* `total_laid_off` (integer)
* `percentage_laid_off` (text)
* `date` (text - to be converted to Date format)
* `stage` (text)
* `country` (text)
* `funds_raised_millions` (integer)
* `row_num` (integer - unique identifier)



## Focus Areas

This project will address several data cleaning tasks:

* **Create Duplicate Table** Ensure or preprocess is done a on duplicate, this is done to mitigate and accidental error affecting the original raw data.
  
* **Duplicate Removal:** Identify and remove duplicate data while preserving the integrity of the original dataset
  
* **Data Standardization:** Ensure consistency in data format and terminology. This includes converting "date" from text to a Date format.
  
* **Null Values:**
    - Handle missing data through identification
    - Replace Blank Values with Null
    - Identify companies that have an existing industry label on some data and are missing it on other data
    - Populate the missing data in these company (Industry Column)
 
      
* **Redundant Rows/Columns:** Identify and remove unnecessary rows or columns that may not contribute valuable information.

**Resources:**

* [AlexTheAnalyst's MySQL YouTube Series](https://github.com/AlexTheAnalyst/MySQL-YouTube-Series)
* [Data Cleaning Tutorial](https://www.youtube.com/watch?v=rGx1QNdYzvs&list=PLUaB-1hjhk8FE_XZ87vPPSfHqb6OcM0cF)


  














Resource:
https://www.youtube.com/watch?v=4UltKCnnnTA


- https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
- https://youtu.be/4UltKCnnnTA?si=e-_El8RIzW3iffW1



