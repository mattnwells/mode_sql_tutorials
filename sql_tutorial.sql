----------------------------
---- BASIC SQL TUTORIAL ----
----------------------------

SELECT *
FROM tutorial.us_housing_units;
  
SELECT year, month, west
FROM tutorial.us_housing_units;

-- Write a query to select all of the columns in the tutorial.us_housing_units table without using *.

SELECT month, month_name, south, west, midwest, northeast
FROM tutorial.us_housing_units;

-- Same query as above with columns aliased.

SELECT year AS "Year",
  month AS "Month", 
  month_name AS "Month Name", 
  south AS "South", 
  west AS "West", 
  midwest AS "Midwest", 
  northeast AS "Northeast"
FROM tutorial.us_housing_units;
  
-- Write a query that uses the LIMIT command to restrict the result set to only 15 rows.  

SELECT *
FROM tutorial.us_housing_units
WHERE month = 1;

-- Did the West Region ever produce more than 50,000 housing units in one month?

SELECT year, month_name, west
FROM tutorial.us_housing_units 
WHERE west > 50;

-- Did the South Region ever produce 20,000 or fewer housing units in one month?

SELECT year, month_name, south
FROM tutorial.us_housing_units 
WHERE south <= 20;

-- Write a query that only shows rows for which the month name is February.

SELECT *
FROM tutorial.us_housing_units 
WHERE month_name = 'February';

-- Write a query that only shows rows for which the month_name starts with the letter "N" or an earlier letter in the alphabet.

SELECT * 
FROM tutorial.us_housing_units 
WHERE month_name < 'o';

-- Write a query that calculates the sum of all four regions in a separate column.

SELECT *, south + west + midwest + northeast AS sum_regions
FROM tutorial.us_housing_units;

-- Write a query that returns all rows for which more units were produced in the West region than in the Midwest and Northeast combined.

SELECT *
FROM tutorial.us_housing_units 
WHERE west > (midwest + northeast);

-- Write a query that calculates the percentage of all houses completed in the United States represented by each region. Only return results from the year 2000 and later.
-- Hint: There should be four columns of percentages.

SELECT year, 
  month,
  south / (south + west + midwest + northeast) * 100 AS south_percent,
  west / (south + west + midwest + northeast) * 100 AS west_percent, 
  midwest /  (south + west + midwest + northeast) * 100 AS midwest_percent, 
  northeast /  (south + west + midwest + northeast) * 100 AS northeast_percent
FROM tutorial.us_housing_units 
WHERE year >= 2000;

-- Write a query that returns all rows for which Ludacris was a member of the group.

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE group_name ILIKE '%Ludacris%';
 
-- Write a query that returns all rows for which the first artist listed in the group has a name that begins with "DJ".

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE group_name ILIKE 'DJ%';

-- Write a query that shows all of the entries for Elvis and M.C. Hammer.
--Hint: M.C. Hammer is actually on the list under multiple names, so you may need to first write a query to figure out exactly how M.C. Hammer is listed. You're likely to face similar problems that require some exploration in many real-life scenarios.

SELECT *
FROM  tutorial.billboard_top_100_year_end
WHERE group_name LIKE 'M.C. Hammer' OR group_name LIKE 'Hammer';

-- Write a query that shows all top 100 songs from January 1, 1985 through December 31, 1990.

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1985 AND 1990;

-- or... 

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year >= 1985 AND year <= 1990;

-- Write a query that shows all of the rows for which song_name is null.

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE song_name IS NULL;
 
 -- Write a query that surfaces all rows for top-10 hits for which Ludacris is part of the Group.

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE group_name ILIKE '%Ludacris%' AND year_rank <= 10;

-- Write a query that surfaces the top-ranked records in 1990, 2000, and 2010.

SELECT * 
FROM tutorial.billboard_top_100_year_end
WHERE year IN(1990, 2000, 2010) AND year_rank = 1;

-- Write a query that lists all songs from the 1960s with "love" in the title.

SELECT * 
FROM tutorial.billboard_top_100_year_end
WHERE (year >= 1960 AND year <=1969) AND song_name ILIKE '%Love%';

-- or...

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1960 AND 1969 AND song_name ilike '%love%';

-- Write a query that returns all rows for top-10 songs that featured either Katy Perry or Bon Jovi.

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank <= 10 AND (group_name ILIKE '%Katy Perry%' OR group_name ILIKE '%Bon Jovi%');
-- Parentheses are key!

-- Write a query that returns all songs with titles that contain the word "California" in either the 1970s or 1990s.

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE song_name ILIKE '%California' AND (year BETWEEN 1970 AND 1979 OR year BETWEEN 1900 AND 1999);
-- BETWEEN is inclusive of the years stated, using logical operators is a more explicit option. 

-- Write a query that lists all top-100 recordings that feature Dr. Dre before 2001 or after 2009.

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank <= 100 AND group_name ILIKE '%Dr. Dre%' AND (year < 2001 OR year > 2009);
-- "feature" in the question is confusing, in this case it's used all inclusively, not in the traditional music sense of "featuring" artist XYZ.

-- Write a query that returns all rows for songs that were on the charts in 2013 and do not contain the letter "a".

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 2013 AND song_name NOT ILIKE '%a%';

-- Write a query that returns all rows from 2012, ordered by song title from Z to A.

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 2012 
ORDER BY song_name DESC;

-- Write a query that returns all rows from 2010 ordered by rank, with artists ordered alphabetically for each song.

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 2010
ORDER BY year_rank, artist;
 
 -- Write a query that shows all rows for which T-Pain was a group member, ordered by rank on the charts, from lowest to highest rank (from 100 to 1).
 
SELECT * 
FROM tutorial.billboard_top_100_year_end
WHERE group_name ILIKE '%T-Pain%' 
ORDER BY year_rank DESC;

-- Write a query that returns songs that ranked between 10 and 20 (inclusive) in 1993, 2003, or 2013. Order the results by year and rank, and leave a comment on each line of the WHERE clause to indicate what that line does.

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank BETWEEN 10 AND 20 -- Selects ranks 10-20
  AND year IN(1993, 2003, 2013) -- Selects relevant years
ORDER BY year, year_rank;

-----------------------------------
---- INTERMEDIATE SQL TUTORIAL ----
-----------------------------------

-- Write a query to count the number of non-null rows in the low column.

SELECT COUNT(low) AS count_low
FROM tutorial.aapl_historical_stock_price;

-- Write a query that determines counts of every single column. With these counts, can you tell which column has the most null values?

SELECT COUNT(date) AS count_date, 
  COUNT(year) AS count_year, 
  COUNT(month) AS count_month, 
  COUNT(open) AS count_open, 
  COUNT(high) AS count_high, 
  COUNT(low) AS count_low, 
  COUNT(close) AS count_close, 
  COUNT(volume) AS count_volume, 
  COUNT(id) AS count_id
FROM tutorial.aapl_historical_stock_price;

-- Write a query to calculate the average opening price (hint: you will need to use both COUNT and SUM, as well as some simple arithmetic.)

SELECT SUM(open) / COUNT(open) AS average
FROM tutorial.aapl_historical_stock_price;

-- What was Apple's lowest stock price (at the time of this data collection)?

SELECT MIN(low) AS low_price
FROM tutorial.aapl_historical_stock_price;

-- What was the highest single-day increase in Apple's share value?

SELECT MAX(close - open)
FROM tutorial.aapl_historical_stock_price;

-- Write a query that calculates the average daily trade volume for Apple stock.

SELECT AVG(volume) AS avg_vol
FROM tutorial.aapl_historical_stock_price;

-- Calculate the total number of shares traded each month. Order your results chronologically.

SELECT year, month, SUM(volume) AS vol_sum
FROM tutorial.aapl_historical_stock_price
GROUP BY year, month
ORDER BY year, month;

-- Write a query to calculate the average daily price change in Apple stock, grouped by year.

SELECT year, AVG(close - open) AS avg_daily_price_change
FROM tutorial.aapl_historical_stock_price
GROUP BY year
ORDER BY year;

-- Write a query that calculates the lowest and highest prices that Apple stock achieved each month.

SELECT year, month, MIN(low) AS low, MAX(high) AS high
FROM tutorial.aapl_historical_stock_price
GROUP BY year, month
ORDER BY year, month;

/* Clause ordering...

SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY

CASE statment = if/then logic
WHEN / THEN statment
END statment

*/ 

SELECT * FROM benn.college_football_players;

SELECT player_name,
       year,
  CASE WHEN year = 'SR' THEN 'yes'
  ELSE 'no' END AS is_a_senior
FROM benn.college_football_players;

-- Write a query that includes a column that is flagged "yes" when a player is from California, and sort the results with those players first.

SELECT *,
  CASE WHEN state = 'CA' THEN 'yes'
  ELSE NULL END AS is_californian
FROM benn.college_football_players
ORDER BY is_californian;

-- Alternative solution...

SELECT player_name,
       state,
  CASE WHEN state = 'CA' THEN 'yes'
  ELSE NULL END AS from_california
FROM benn.college_football_players
ORDER BY 3;
 
 -- Write a query that includes players' names and a column that classifies them into four categories based on height. Keep in mind that the answer we provide is only one of many possible answers, since you could divide players' heights in many ways.
 
SELECT player_name, height,
  CASE WHEN height > 78 THEN 'over 78'
  WHEN height > 72 AND height <= 78 THEN '73 - 78'
  WHEN height > 66 AND height <= 72 THEN '66 - 72'
  ELSE 'under 66' END AS height_group
FROM benn.college_football_players
ORDER BY height DESC;

-- Write a query that selects all columns from benn.college_football_players and adds an additional column that displays the player's name if that player is a junior or senior.

SELECT *,
  CASE WHEN year = 'JR' OR year = 'SR' THEN player_name 
  ELSE NULL END AS names_jr_sr
FROM benn.college_football_players;

-- Alternate solution...

SELECT *,
  CASE WHEN year IN ('JR', 'SR') THEN player_name 
  ELSE NULL END AS upperclass_player_name
FROM benn.college_football_players;

-- Write a query that counts the number of 300lb+ players for each of the following regions: West Coast (CA, OR, WA), Texas, and Other (everywhere else).

SELECT CASE WHEN state IN ('CA', 'OR', 'WA') THEN 'West Coast'
  WHEN state = 'TX' THEN 'Texas'
  ELSE 'Other' END AS arbitrary_regional_designation,
  COUNT(1) AS players
FROM benn.college_football_players
WHERE weight >= 300
GROUP BY 1;

-- Write a query that calculates the combined weight of all underclass players (FR/SO) in California as well as the combined weight of all upperclass players (JR/SR) in California.

SELECT CASE WHEN year IN ('FR', 'SO') THEN 'Under Class'
    WHEN year IN ('JR', 'SR') THEN 'Upper Class' 
    ELSE NULL END AS class_group, 
  SUM(weight) AS combined_weight
FROM benn.college_football_players
WHERE state = 'CA'
GROUP BY class_group;

SELECT CASE WHEN year = 'FR' THEN 'FR'
            WHEN year = 'SO' THEN 'SO'
            WHEN year = 'JR' THEN 'JR'
            WHEN year = 'SR' THEN 'SR'
            ELSE 'No Year Data' END AS year_group,
            COUNT(1) AS count
  FROM benn.college_football_players
GROUP BY 1;

SELECT COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS fr_count,
       COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS so_count,
       COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS jr_count,
       COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS sr_count
  FROM benn.college_football_players;
  
  -- Write a query that displays the number of players in each state, with FR, SO, JR, and SR players in separate columns and another column for the total number of players. Order results such that states with the most players come first.
  
SELECT state,
    COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS fr_count,
    COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS so_count,
    COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS jr_count,
    COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS sr_count,
    COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) +
    COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) +
    COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) +
    COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS total
FROM benn.college_football_players
GROUP BY state
ORDER BY total DESC;

-- Alternative more artful solution...

SELECT state,
       COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS fr_count,
       COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS so_count,
       COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS jr_count,
       COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS sr_count,
       COUNT(1) AS total_players
  FROM benn.college_football_players
 GROUP BY state
 ORDER BY total_players DESC;
 
 -- Write a query that shows the number of players at schools with names that start with A through M, and the number at schools with names starting with N - Z.
 
SELECT CASE WHEN school_name < 'n' THEN 'A-M'
            WHEN school_name >= 'n' THEN 'N-Z'
            ELSE NULL END AS school_name_group,
       COUNT(1) AS players
FROM benn.college_football_players
GROUP BY school_name_group;

-- Write a query that returns the unique values in the year column, in chronological order.

SELECT DISTINCT year 
FROM tutorial.aapl_historical_stock_price
ORDER BY year;

SELECT month,
       AVG(volume) AS avg_trade_volume
FROM tutorial.aapl_historical_stock_price
GROUP BY month
ORDER BY 2 DESC;
 
-- WARNING: Using DISTINCT can slow queries substantially
 
-- Write a query that counts the number of unique values in the month column for each year.

SELECT year, COUNT(DISTINCT month) AS month_count
FROM tutorial.aapl_historical_stock_price
GROUP BY year
ORDER BY year;

-- Write a query that separately counts the number of unique values in the month column and the number of unique values in the `year` column.

SELECT COUNT(DISTINCT month) AS month_count, COUNT(DISTINCT year) AS year_count
FROM tutorial.aapl_historical_stock_price;

-- Write a query that separately counts the number of unique values in the month column and the number of unique values in the `year` column.

SELECT COUNT(DISTINCT year) AS years_count, COUNT(DISTINCT month) AS months_count
FROM tutorial.aapl_historical_stock_price;

-- Write a query that selects the school name, player name, position, and weight for every player in Georgia, ordered by weight (heaviest to lightest). Be sure to make an alias for the table, and to reference all column names in relation to the alias.

SELECT players.school_name, players.player_name, players.position, players.weight
FROM benn.college_football_players players
WHERE state = 'GA'
ORDER BY players.weight DESC;

-- Write a query that displays player names, school names and conferences for schools in the "FBS (Division I-A Teams)" division.
 
SELECT players.player_name, players.school_name, teams.conference, teams.division
FROM benn.college_football_players players JOIN benn.college_football_teams teams ON players.school_name = teams.school_name
WHERE teams.division = 'FBS (Division I-A Teams)';

/*

Outer joins are joins that return matched values and unmatched values from either or both tables. There are a few types of outer joins:

LEFT JOIN returns only unmatched rows from the left table, as well as matched rows in both tables.
RIGHT JOIN returns only unmatched rows from the right table , as well as matched rows in both tables.
FULL OUTER JOIN returns unmatched rows from both tables,as well as matched rows in both tables.

*/

-- Write a query that performs an inner join between the tutorial.crunchbase_acquisitions table and the tutorial.crunchbase_companies table, but instead of listing individual rows, count the number of non-null rows in each table.

SELECT COUNT(companies.permalink) AS companies_rowcount, COUNT(acquisitions.company_permalink) AS acquisitions_rowcount
FROM tutorial.crunchbase_companies companies
INNER JOIN tutorial.crunchbase_acquisitions acquisitions ON companies.permalink = acquisitions.company_permalink;

-- Modify the query above to be a LEFT JOIN. Note the difference in results.

SELECT COUNT(companies.permalink) AS companies_rowcount, COUNT(acquisitions.company_permalink) AS acquisitions_rowcount
FROM tutorial.crunchbase_companies companies
LEFT JOIN tutorial.crunchbase_acquisitions acquisitions ON companies.permalink = acquisitions.company_permalink;

-- Count the number of unique companies (don't double-count companies) and unique acquired companies by state. Do not include results for which there is no state data, and order by the number of acquired companies from highest to lowest.

SELECT companies.state_code, COUNT(DISTINCT(companies.permalink)) AS unique_companies, COUNT(DISTINCT(acquisitions.company_permalink)) AS unique_companies_acquired
FROM tutorial.crunchbase_companies companies
LEFT JOIN tutorial.crunchbase_acquisitions acquisitions ON companies.permalink = acquisitions.company_permalink
WHERE companies.state_code IS NOT NULL
GROUP BY companies.state_code
ORDER BY unique_companies_acquired DESC; 

/*

RIGHT JOIN can be avoided entirely by switching the table order and using LEFT JOIN exclusively. RIGHT JOIN and LEFT JOIN can both be written as RIGHT OUTER JOIN and LEFT OUTER JOIN respectively.

*/

-- Rewrite the previous practice query in which you counted total and acquired companies by state, but with a RIGHT JOIN instead of a LEFT JOIN. The goal is to produce the exact same results.

SELECT companies.state_code, COUNT(DISTINCT(companies.permalink)) AS unique_companies, COUNT(DISTINCT(acquisitions.company_permalink)) AS unique_companies_acquired
FROM tutorial.crunchbase_acquisitions acquisitions
RIGHT JOIN tutorial.crunchbase_companies companies ON companies.permalink = acquisitions.company_permalink
WHERE companies.state_code IS NOT NULL
GROUP BY companies.state_code
ORDER BY unique_companies_acquired DESC;
 
 -- Write a query that shows a company's name, "status" (found in the Companies table), and the number of unique investors in that company. Order by the number of investors from most to fewest. Limit to only companies in the state of New York.

SELECT companies.name AS company_name, companies.status, COUNT(DISTINCT investments.investor_name) AS unique_investors
FROM tutorial.crunchbase_companies companies 
LEFT JOIN tutorial.crunchbase_investments investments ON companies.permalink = investments.company_permalink
WHERE companies.state_code = 'NY'
GROUP BY companies.name, companies.status
ORDER BY unique_investors DESC;

-- Write a query that lists investors based on the number of companies in which they are invested. Include a row for companies with no investor, and order from most companies to least.

SELECT CASE WHEN investments.investor_name IS NULL THEN 'No Investors'
ELSE investments.investor_name END AS investor, COUNT(DISTINCT companies.permalink) AS companies_invested_in
FROM tutorial.crunchbase_companies companies
LEFT JOIN tutorial.crunchbase_investments investments ON companies.permalink = investments.company_permalink
GROUP BY investments.investor_name
ORDER BY companies_invested_in DESC;

SELECT COUNT(CASE WHEN companies.permalink IS NOT NULL AND acquisitions.company_permalink IS NULL
                  THEN companies.permalink ELSE NULL END) AS companies_only,
       COUNT(CASE WHEN companies.permalink IS NOT NULL AND acquisitions.company_permalink IS NOT NULL
                  THEN companies.permalink ELSE NULL END) AS both_tables,
       COUNT(CASE WHEN companies.permalink IS NULL AND acquisitions.company_permalink IS NOT NULL
                  THEN acquisitions.company_permalink ELSE NULL END) AS acquisitions_only
  FROM tutorial.crunchbase_companies companies
  FULL JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink;
    
-- Write a query that joins tutorial.crunchbase_companies and tutorial.crunchbase_investments_part1 using a FULL JOIN. Count up the number of rows that are matched/unmatched as in the example above.

SELECT 
  COUNT(CASE WHEN companies.permalink IS NOT NULL AND investments.company_permalink IS NULL 
    THEN companies.permalink ELSE NULL END) AS companies_only,
  COUNT(CASE WHEN companies.permalink IS NOT NULL AND investments.company_permalink IS NOT NULL
    THEN companies.permalink ELSE NULL END) AS both_tables,
  COUNT(CASE WHEN companies.permalink IS NULL AND investments.company_permalink IS NOT NULL
    THEN investments.company_permalink ELSE NULL END) AS investments_only
FROM tutorial.crunchbase_companies companies
FULL JOIN tutorial.crunchbase_investments_part1 investments ON companies.permalink = investments.company_permalink;

/* 
Note that UNION only appends distinct values. More specifically, when you use UNION, the dataset is appended, and any rows in the appended table that are exactly identical to rows in the first table are dropped.

SQL has strict rules for appending data:

Both tables must have the same number of columns
The columns must have the same data types in the same order as the first table 

While the column names don't necessarily have to be the same, you will find that they typically do.
*/

-- Write a query that appends the two crunchbase_investments datasets above (including duplicate values). Filter the first dataset to only companies with names that start with the letter "T", and filter the second to companies with names starting with "M" (both not case-sensitive). Only include the company_permalink, company_name, and investor_name columns.

SELECT company_permalink, company_name, investor_name
FROM tutorial.crunchbase_investments_part1
WHERE company_name ILIKE 'T%'
  
UNION ALL
  
SELECT company_permalink, company_name, investor_name
FROM tutorial.crunchbase_investments_part2
WHERE company_name ILIKE 'M%';

-- Write a query that shows 3 columns. The first indicates which dataset (part 1 or 2) the data comes from, the second shows company status, and the third is a count of the number of investors.
-- Hint: you will have to use the tutorial.crunchbase_companies table as well as the investments tables. And you'll want to group by status and dataset.

SELECT 'investments_part1' AS dataset_name, companies.status, COUNT(DISTINCT investments.investor_permalink) AS investors
FROM tutorial.crunchbase_companies companies
LEFT JOIN tutorial.crunchbase_investments_part1 investments ON companies.permalink = investments.company_permalink
GROUP BY 1,2

UNION ALL
 
SELECT 'investments_part2' AS dataset_name, companies.status, COUNT(DISTINCT investments.investor_permalink) AS investors
FROM tutorial.crunchbase_companies companies
LEFT JOIN tutorial.crunchbase_investments_part2 investments ON companies.permalink = investments.company_permalink
GROUP BY 1,2;

-- Note: You can enter any type of conditional statement into the ON clause! AND, >, <, etc. This allows you to join only relevant rows without joining all rows and filtering after the fact.
-- Note: Joining on multiple keys can increase accuracy and query speed. 

-- Joining a table to itself, exmaple: You want to identify companies that received an investment from Great Britain following an investment from Japan.

SELECT DISTINCT japan_investments.company_name, japan_investments.company_permalink
FROM tutorial.crunchbase_investments_part1 japan_investments
JOIN tutorial.crunchbase_investments_part1 gb_investments
  ON japan_investments.company_name = gb_investments.company_name
    AND gb_investments.investor_country_code = 'GBR'
    AND gb_investments.funded_at > japan_investments.funded_at
WHERE japan_investments.investor_country_code = 'JPN'
ORDER BY 1;

-------------------------------
---- ADVANCED SQL TUTORIAL ---- 
-------------------------------

-- Note: COUNT works with all data types, SUM only works with numeric data types. 

-- Convert the funding_total_usd and founded_at_clean columns in the tutorial.crunchbase_companies_clean_date table to strings (varchar format) using a different formatting function for each one.

SELECT CAST(funding_total_usd AS varchar) AS funding_total_usd_string, founded_at_clean::varchar AS founded_at_string
FROM tutorial.crunchbase_companies_clean_date;

-- Write a query that counts the number of companies acquired within 3 years, 5 years, and 10 years of being founded (in 3 separate columns). Include a column for total companies acquired as well. Group by category and limit to only rows with a founding date.

SELECT companies.category_code,
  COUNT(CASE WHEN acquisitions.acquired_at_cleaned <= companies.founded_at_clean::timestamp + INTERVAL '3 years' THEN 1 ELSE NULL END) AS acquired_3_yrs,
  COUNT(CASE WHEN acquisitions.acquired_at_cleaned <= companies.founded_at_clean::timestamp + INTERVAL '5 years' THEN 1 ELSE NULL END) AS acquired_5_yrs,
  COUNT(CASE WHEN acquisitions.acquired_at_cleaned <= companies.founded_at_clean::timestamp + INTERVAL '10 years' THEN 1 ELSE NULL END) AS acquired_10_yrs,
  COUNT(1) AS total
FROM tutorial.crunchbase_companies_clean_date companies
  JOIN tutorial.crunchbase_acquisitions_clean_date acquisitions ON acquisitions.company_permalink = companies.permalink
WHERE founded_at_clean IS NOT NULL
GROUP BY 1
ORDER BY 5 DESC;

-- Note: Remember that inner-most funciton always evaluated first! 
-- TRIM() arguments 'leading', 'trailing', 'both'

-- Write a query that separates the `location` field into separate fields for latitude and longitude. You can compare your results against the actual `lat` and `lon` fields in the table.

SELECT location,
  TRIM(leading '(' FROM LEFT(location, POSITION(',' IN location) - 1)) AS lattitude,
  TRIM(trailing ')' FROM RIGHT(location, LENGTH(location) - POSITION(',' IN location) ) ) AS longitude
FROM tutorial.sf_crime_incidents_2014_01;

-- Concatenate the lat and lon fields to form a field that is equivalent to the location field. (Note that the answer will have a different decimal precision.)

SELECT location, 
  CONCAT('(', lat, ', ', lon, ')') AS lat_lon_concat
FROM tutorial.sf_crime_incidents_2014_01;

-- Create the same concatenated location field, but using the || syntax instead of CONCAT.

SELECT location, 
  '(' || lat || ', ' || lon || ')' AS lat_lon_concat
FROM tutorial.sf_crime_incidents_2014_01;

-- Write a query that creates a date column formatted YYYY-MM-DD.

SELECT date, 
  SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2) AS cleaned_date
FROM tutorial.sf_crime_incidents_2014_01;

--  Write a query that returns the `category` field, but with the first letter capitalized and the rest of the letters in lower-case.

SELECT category, 
  UPPER(LEFT(category, 1)) || LOWER(RIGHT(category, LENGTH(category) - 1)) AS category_clean
FROM tutorial.sf_crime_incidents_2014_01;

-- Write a query that creates an accurate timestamp using the date and time columns in tutorial.sf_crime_incidents_2014_01. Include a field that is exactly 1 week later as well.

SELECT incidnt_num,
  (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2) || ' ' || time || ':00')::timestamp AS timestamp,
  (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2) || ' ' || time || ':00')::timestamp + INTERVAL '1week' AS timestamp_plus_interval
FROM tutorial.sf_crime_incidents_2014_01;

-- Write a query that counts the number of incidents reported by week. Cast the week as a date to get rid of the hours/minutes/seconds.

SELECT DATE_TRUNC('week', cleaned_date)::date AS week_beginning, 
  COUNT(*) AS incidents
FROM tutorial.sf_crime_incidents_cleandate
GROUP BY 1
ORDER BY 1;

-- Write a query that shows exactly how long ago each indicent was reported. Assume that the dataset is in Pacific Standard Time (UTC - 8).

SELECT *, 
  NOW() AT TIME ZONE 'PST' AS now,
  NOW() AT TIME ZONE 'PST' - cleaned_date AS time_ago 
FROM tutorial.sf_crime_incidents_cleandate;

-- Use COALESCE to replace NULLS. Example: COALESCE(descript, 'No Description') replaces NULL descriptions with 'No Description'. 

-- Write a query that selects all Warrant Arrests from the tutorial.sf_crime_incidents_2014_01 dataset, then wrap it in an outer query that only displays unresolved incidents.

SELECT sub.*
  FROM (
    SELECT *
    FROM tutorial.sf_crime_incidents_2014_01
    WHERE descript = 'WARRANT ARREST'
  ) sub
WHERE sub.resolution = 'NONE';

-- Write a query that displays the average number of monthly incidents for each category. Hint: use tutorial.sf_crime_incidents_cleandate to make your life a little easier.

SELECT sub.category, AVG(sub.incidents) AS avg_incidents_per_month
  FROM (
    SELECT EXTRACT('month' FROM cleaned_date) AS month,
      category,
      COUNT(1) AS incidents
    FROM tutorial.sf_crime_incidents_cleandate
    GROUP BY 1,2
    ) sub
GROUP BY 1;

-- Write a query that displays all rows from the three categories with the fewest incidents reported.

SELECT incidents.*, sub.count AS total_incidents_in_category
FROM tutorial.sf_crime_incidents_2014_01 incidents
JOIN
    (
    SELECT category, COUNT(*) AS count
    FROM tutorial.sf_crime_incidents_2014_01
    GROUP BY 1
    ORDER BY 2
    LIMIT 3
    ) sub
ON sub.category = incidents.category;

-- Write a query that counts the number of companies founded and acquired by quarter starting in Q1 2012. Create the aggregations in two separate queries, then join them.

SELECT COALESCE(companies.quarter, acquisitions.quarter) AS quarter, companies.companies_founded, acquisitions.companies_acquired
FROM (
    SELECT founded_quarter AS quarter, COUNT(permalink) AS companies_founded
    FROM tutorial.crunchbase_companies
    WHERE founded_year >= 2012
    GROUP BY 1
  ) companies
LEFT JOIN (
    SELECT acquired_quarter AS quarter, COUNT(DISTINCT company_permalink) AS companies_acquired
    FROM tutorial.crunchbase_acquisitions
    WHERE acquired_year >= 2012
    GROUP BY 1
  ) acquisitions
ON companies.quarter = acquisitions.quarter
ORDER BY 1;

-- Write a query that ranks investors from the combined dataset above by the total number of investments they have made.

SELECT investor_name, COUNT(*) AS investments
FROM (
    SELECT *
    FROM tutorial.crunchbase_investments_part1
    UNION ALL
    SELECT *
    FROM tutorial.crunchbase_investments_part2
    ) sub
GROUP BY 1
ORDER BY 2 DESC;

-- Write a query that does the same thing as in the previous problem, except only for companies that are still operating. Hint: operating status is in tutorial.crunchbase_companies.

SELECT investor_name, COUNT(*) AS investments
FROM (
    SELECT *
    FROM tutorial.crunchbase_investments_part1
    UNION ALL
    SELECT *
    FROM tutorial.crunchbase_investments_part2
    ) sub
GROUP BY 1
ORDER BY 2 DESC;

-- Write a query that does the same thing as in the previous problem, except only for companies that are still operating. Hint: operating status is in tutorial.crunchbase_companies.

SELECT investments.investor_name, COUNT(investments.*) AS investments
FROM tutorial.crunchbase_companies companies
JOIN (
  SELECT *
  FROM tutorial.crunchbase_investments_part1
  UNION ALL
  SELECT *
  FROM tutorial.crunchbase_investments_part2
  ) investments
ON investments.company_permalink = companies.permalink
WHERE companies.status = 'operating'
GROUP BY 1
ORDER BY 2 DESC;

 -- Write a query modification of the above example query that shows the duration of each ride as a percentage of the total time accrued by riders from each start_terminal.

SELECT start_terminal, duration_seconds,
  SUM(duration_seconds) OVER (PARTITION BY start_terminal) AS start_terminal_sum,
  (duration_seconds/SUM(duration_seconds) OVER (PARTITION BY start_terminal))*100 AS pct_of_total_time
FROM tutorial.dc_bikeshare_q1_2012
WHERE start_time < '2012-01-08'
ORDER BY 1, 4 DESC;

-- Write a query that shows a running total of the duration of bike rides (similar to the last example), but grouped by end_terminal, and with ride duration sorted in descending order.

SELECT end_terminal, duration_seconds,
  SUM(duration_seconds) OVER (PARTITION BY end_terminal ORDER BY duration_seconds DESC) AS running_total
FROM tutorial.dc_bikeshare_q1_2012
WHERE start_time < '2012-01-08';

-- Write a query that shows the 5 longest rides from each starting terminal, ordered by terminal, and longest to shortest rides within each terminal. Limit to rides that occurred before Jan. 8, 2012.

SELECT *
  FROM (
        SELECT start_terminal,
               start_time,
               duration_seconds AS trip_time,
               RANK() OVER (PARTITION BY start_terminal ORDER BY duration_seconds DESC) AS rank
          FROM tutorial.dc_bikeshare_q1_2012
         WHERE start_time < '2012-01-08'
               ) sub
 WHERE sub.rank <= 5;

-- Write a query that shows only the duration of the trip and the percentile into which that duration falls (across the entire dataset—not partitioned by terminal).

SELECT duration_seconds,
       NTILE(100) OVER (ORDER BY duration_seconds) AS percentile
FROM tutorial.dc_bikeshare_q1_2012
WHERE start_time < '2012-01-08'
ORDER BY 1 DESC;



