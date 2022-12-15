create table if not exists spacex(
Date date,Time time,Booster_Version varchar(100),lounch_Site varchar(100),
Payload varchar (100), PAYLOAD_MASS_KG_ INT,Orbit varchar(100),Customer varchar (100),
Mission_Outcome	varchar(100),Landing_Outcome varchar (100)
)
select * from spacex
SET client_encoding = 'ISO_8859_5';
copy spacex(Date,Time,Booster_Version,lounch_Site,Payload,PAYLOAD_MASS_KG_,Orbit,Customer,
Mission_Outcome,Landing_Outcome)
From 'C:\postgreySQL\Spacex.csv'
DELIMITER ','
CSV HEADER;
select * from spacex
-- Task1-Display the names of the unique launch sites  in the space mission
select distinct(lounch_site) from spacex
-- Task 2
--  Display 5 records where launch sites begin with the string 'CCA'
select * from spacex where lounch_site like 'CCA%' limit 5
-- Task 3
--  Display the total payload mass carried by boosters launched by NASA (CRS)
select booster_version,customer,sum(payload_mass_kg_) from spacex
where customer like 'NASA_(CRS)%'
GROUP BY customer,booster_version
-- Task 4
-- Display average payload mass carried by booster version F9 v1.1
select booster_version,avg(payload_mass_kg_) from spacex 
where booster_version like 'F9 v1.1%'
group by booster_version
-- Task 5
-- List the date when the first successful landing outcome in ground pad was acheived.
select * from spacex
select min(date) as firstsuccessful from spacex
where landing_outcome like 'success (ground pad)'

-- Task 6
--  List the names of the boosters which have success in drone ship and have payload mass greater than 4000 but less than 6000
select booster_version from spacex 
where landing_outcome='success (drone ship)' 
AND payload_mass_kg_ > 4000 
AND payload_mass_kg_ < 6000

-- Task 7
-- List the total number of successful and failure mission outcomes
select * from spacex
select mission_outcome,count(distinct(mission_outcome)) from spacex group by mission_outcome
-- Task 8
--  List the   names of the booster_versions which have carried the maximum payload mass. Use a subquery
select booster_version, max(payload_mass_kg_)from spacex group by booster_version
order by max(payload_mass_kg_) desc limit 1
-- Task 9
--  List the failed landing_outcomes in drone ship, their booster versions, and launch site names for in year 2015
select booster_version,lounch_site,extract(year from  date) from spacex where landing_outcome ='Failure (drone ship)'
-- or
SELECT Booster_Version, Lounch_Site, Landing_Outcome FROM SpaceX
WHERE Landing_Outcome LIKE 'Failure (drone ship)'
AND Date BETWEEN '2015-01-01' AND '2015-12-31'
-- Task 10
--  Rank the count of landing outcomes (such as Failure (drone ship) or Success (ground pad)) between the date 2010-06-04 and 2017-03-20, in descending order
select * from spacex
SELECT landing_outcome, COUNT(landing_Outcome) FROM SpaceX
WHERE DATE BETWEEN '2010-06-04' AND '2017-03-20'
GROUP BY landing_Outcome
ORDER BY COUNT(Landing_Outcome) DESC
