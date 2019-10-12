--1.
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'naep';

--2.
SELECT*
FROM naep
LIMIT 50;

--3.
SELECT COUNT(avg_math_4_score), AVG(avg_math_4_score), MIN(avg_math_4_score),MAX(avg_math_4_score), state
FROM naep
GROUP BY state
ORDER BY state ASC;

--4.
SELECT COUNT(avg_math_4_score), AVG(avg_math_4_score), MAX(avg_math_4_score),MIN(avg_math_4_score), state
FROM naep
GROUP BY state
HAVING MAX(avg_math_4_score) - MIN(avg_math_4_score) > 30
ORDER BY state ASC;

--5.
SELECT avg_math_4_score AS bottom_10_states, year, state
FROM naep
WHERE year = 2000 AND  avg_math_4_score is not null
ORDER BY bottom_10_states ASC
LIMIT 10;

--6.
SELECT AVG(avg_math_4_score), state
FROM naep
WHERE year = 2000
--1.
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'naep';

--2.
SELECT*
FROM naep
LIMIT 50;

--3.
SELECT COUNT(avg_math_4_score), AVG(avg_math_4_score), MIN(avg_math_4_score),MAX(avg_math_4_score), state
FROM naep
GROUP BY state
ORDER BY state ASC;

--4.
SELECT COUNT(avg_math_4_score), AVG(avg_math_4_score), MAX(avg_math_4_score),MIN(avg_math_4_score), state
FROM naep
GROUP BY state
HAVING MAX(avg_math_4_score) - MIN(avg_math_4_score) > 30
ORDER BY state ASC;

--5.
SELECT avg_math_4_score AS bottom_10_states, year, state
FROM naep
WHERE year = 2000 AND  avg_math_4_score is not null
ORDER BY bottom_10_states ASC
LIMIT 10;

--6.
SELECT ROUND(AVG(avg_math_4_score), 2), year
FROM naep
WHERE year = 2000
GROUP BY year;

--7.
SELECT avg_math_4_score AS below_average_states_y2000 , state, year
FROM naep
WHERE year = 2000 AND  avg_math_4_score < 224.80
ORDER BY below_average_states_y2000;

--8. 
SELECT avg_math_4_score AS scores_missing_y2000 , state, year
FROM naep
WHERE year = 2000 AND avg_math_4_score is null 
ORDER BY scores_missing_y2000;

--9.
SELECT  finance.state, ROUND((avg_math_4_score),2), total_expenditure, finance.year, finance.id
FROM naep 
LEFT OUTER JOIN finance ON naep.id = finance.id
WHERE finance.year = 2000 AND avg_math_4_score is not null
ORDER BY total_expenditure DESC; 