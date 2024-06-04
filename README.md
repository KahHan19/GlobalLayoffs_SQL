# SQL_DataCleaning

## Dataset
- FROM: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
- This dataset include data of company lay offs around the world in 2021
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text, (Which would be atered later in the project from text -> Date)
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT



## Focus

- Duplicate Table
1. Ensure that we are not manipulating the raw data, in case of mistakes


- Data Cleaning (Preprocessing)
2. Remove Duplicates
      - Indetify Duplicate Data and Asses the importance of the data
      - Duplicate a table to include a unique key indentifier for individual row (In our case is row number count)
      - Delete Duplicate rows
  

3. Standardise Data
     - Indetify row which includes data with the same meaning but morphologically different
     - Update the data into the same name categories
     - Modify Date from "Text" -> "Date"
  
4. Null Values
     - Identify Null and Blank Values in Data
     - Replace Blank Values with Null
     - Identify companies that have an existing industry label on some data and are missing it on other data
     - Populate the missing data in these company (Industry Column)

5. Remove Redundant Row/Column
     - Remove row and column that are deemed unecessary
     - Remove Column that contains too much null values.
  















Resource:
https://www.youtube.com/watch?v=4UltKCnnnTA


- https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
- https://youtu.be/4UltKCnnnTA?si=e-_El8RIzW3iffW1



