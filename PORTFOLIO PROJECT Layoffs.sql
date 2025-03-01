---#EXPLORATARY DATA ANALYSIS

select * 
FROM layoffs_stagging2;

select MAX(total_laid_off),max(percentage_laid_off)
FROM layoffs_stagging2;

SELECT * FROM layoffs_stagging2
WHERE percentage_laid_off = 1
order by total_laid_off DESC;

select company,sum(total_laid_off)
FROM layoffs_stagging2
group by company
ORDER by 2 desc;

SELECT MIN(date), MAX(DATE)
from layoffs_stagging2;

select INDUSTRY,sum(total_laid_off)
FROM layoffs_stagging2
GROUP BY INDUSTRY
order by 2 DESC;

select country,sum(total_laid_off)
FROM layoffs_stagging2
GROUP BY country
order by 2 DESC;

select * 
FROM layoffs_stagging2;
 
select year(`DATE`),sum(total_laid_off)
FROM layoffs_stagging2
GROUP BY year(`DATE`)
order by 2 DESC;

select stage,sum(total_laid_off)
FROM layoffs_stagging2
GROUP BY stage
order by 2 DESC;

 SELECT substr(`DATE`,1,7) 'MONTH',sum(TOTAL_LAID_OFF)
 from layoffs_stagging2
 WHERE substr(`DATE`,1,7) IS NOT NULL
 group by substr(`DATE`,1,7)
 order by 1 ASC;

WITH ROLLING_TOTAL AS
( SELECT substr(`DATE`,1,7)'MONTH',sum(TOTAL_LAID_OFF) 'TOT'
 from layoffs_stagging2
 WHERE substr(`DATE`,1,7) IS NOT NULL
 group by substr(`DATE`,1,7)
 order by 1 ASC)
 select `MONTH`, TOT
 ,sum(TOT) OVER(order by `MONTH`) 'ROLLING TOTAL'
 FROM ROLLING_TOTAL;
 
 SELECT COMPANY, YEAR(`DATE`),SUM(TOTAL_LAID_OFF)
 FROM layoffs_stagging2
 group by company, year(`DATE`)
 order by 3 DESC;
 
 WITH COMPANY_YEAR(COMPANY,YEARS,TOTAL_LAID_OFF) AS
 (
 SELECT COMPANY, YEAR(`DATE`),SUM(TOTAL_LAID_OFF)
 FROM layoffs_stagging2
 group by company, year(`DATE`) 
 order by 3 DESC), 
 COMPANY_RANK AS
( SELECT *, dense_rank() over(partition by YEARS order by TOTAL_LAID_OFF desc) RANKS
 FROM COMPANY_YEAR
 WHERE YEARS IS NOT NULL)
 SELECT * FROM COMPANY_RANK
 WHERE RANKS <=5 ;
 
with industry_year(Industries,Years,total_layoffs) as
(select industry, year(`date`),sum(total_laid_off)
from layoffs_stagging2
group by industry,year(`date`)
order by 2 desc),industry_rank as
(select *,dense_rank() over(partition by years order by total_layoffs desc) as ranking
from industry_year
where years is not null)
select * from industry_rank
where ranking <=5
order by years
