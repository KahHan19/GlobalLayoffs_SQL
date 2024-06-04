Select * 
from layoffs;

# Create a duplicate of raw data to perform Preprocessing
CREATE Table layoffs_staging LIKE layoffs; # Copy the Columns
INSERT layoffs_staging SELECT * FROM layoffs; # Copy Rows
SELECT * from layoffs_staging;


-- 1. Remove Duplicates

# Identify Duplicate Row
WITH duplicate_cte AS
(
SELECT *, 
ROW_NUMBER() OVER(
PARTITION BY company, location , industry, total_laid_off, percentage_laid_off, `date`
, stage,  country, funds_raised_millions) AS row_num
from layoffs_staging
)
SELECT * FROM duplicate_cte
WHERE row_num > 1;

# Create A table with the row_number column
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT * from layoffs_staging2
WHERE row_num = 2;

# Insert infrom mation from layoffs_staging (the row_num acts as a unique indetifier) 
INSERT INTO layoffs_staging2
SELECT *, 
ROW_NUMBER() OVER(
PARTITION BY company, location , industry, total_laid_off, percentage_laid_off, `date`
, stage,  country, funds_raised_millions) AS row_num
from layoffs_staging;

# Delete Duplicate Row
DELETE 
FROM layoffs_staging2
WHERE row_num > 1;

SELECT * from layoffs_staging2
WHERE row_num> 1;











-- 2. Standardised Data
SELECT company, trim(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = trim(company);


# Identify Lables (e.g. "Crypto", "Crypto Currenct" and "CryptoCurrency" means the same thing in root form, we have to update it)
SELECT DISTINCT industry
from layoffs_staging2
ORDER BY 1;

SELECT * FROM layoffs_staging2
WHERE industry like 'Crypto%';

# Change it so that "Crypto", "Crypto Currenct" and "CryptoCurrency" --> "Crypto"
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry like 'Crypto%';

# Check other columns, identified "United States" and "United States."
SELECT DISTINCT country, TRIM(TRAILING '.' FROM country) from layoffs_staging2
order by 1;

# Alternative Method to Remove morphologically similar words
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' from country)
WHERE country LIKE 'United States%';


SELECT `date`
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = str_to_date(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY column `date` DATE;



-- 3. Null Values
SELECT *
from layoffs_staging2 WHERE industry is NULL or industry = "";

# Populate the industry
SELECT * from layoffs_staging2
WHERE company = "Airbnb";


# Identify companies that have an existing industry label on some data and are missing it on other data
SELECT t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	on t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
and t2.industry IS NOT NULL;

# Change all empty blank with null (due to inability to update blank)
UPDATE layoffs_staging2
SET industry = NULL 
WHERE industry = '';


# Populate missing industry for company with same name and location
UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	on t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL)
and t2.industry IS NOT NULL;


# Bally's has not duplicate data therefore we have nothing to populate with 
SELECT * from layoffs_staging2
WHERE industry is null;


-- 4. Remove Redundant Row/Column

# As we are interested in layoff, these are the data that does not include the important data
SELECT * FROM layoffs_staging2
WHERE total_laid_off IS NULL
and percentage_laid_off is NULL;


DELETE FROM layoffs_staging2
WHERE total_laid_off IS NULL
and percentage_laid_off is NULL;

ALTER TABLE layoffs_staging2
DROP column row_num;


SELECT * FROM layoffs_staging2;