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
 
-- WARNING: Using DISTINCT can slow queries substantially!

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

