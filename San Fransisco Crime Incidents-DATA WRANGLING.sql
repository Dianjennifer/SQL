SELECT * FROM tutorial.sf_crime_incidents_2014_01;

---------Cleaning Date and Time

SELECT incidnt_num,
       date,
       LEFT(date, 10) AS cleaned_date,
       RIGHT(date, LENGTH(date) - 11) AS cleaned_time
  FROM tutorial.sf_crime_incidents_2014_01

 ------Using TRIM to remove the brackets from the beginning to the end of the sring
 
  SELECT location,
        TRIM(both '()' FROM location)
  FROM tutorial.sf_crime_incidents_2014_01 
  
-------Using POSITION to retrurn the position of 'A' in descript
 SELECT incidnt_num,
       descript,
       POSITION('A' IN descript) AS a_position
  FROM tutorial.sf_crime_incidents_2014_01
  
-------Using TRIM to separate loaction to lattitude and longitude fields
 SELECT location,
       TRIM(leading '(' FROM LEFT(location, POSITION(',' IN location) - 1)) AS lattitude,
       TRIM(trailing ')' FROM RIGHT(location, LENGTH(location) - POSITION(',' IN location) ) ) AS longitude
  FROM tutorial.sf_crime_incidents_2014_01 
  
-------Combining the longitude and latitude fields using CONCAT
 SELECT CONCAT('(', lat, ', ', lon, ')') AS concat_location,
       location
   FROM tutorial.sf_crime_incidents_2014_01   

--------Chanaging the date format to YYYY-MM-DD
 SELECT incidnt_num,
           date,
           SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2) AS cleaned_date
      FROM tutorial.sf_crime_incidents_2014_01

-------Replacing NULL Values using COALESCE
 SELECT incidnt_num,
       descript,
       COALESCE(descript, 'No Description')
  FROM tutorial.sf_crime_incidents_cleandate
 ORDER BY descript DESC
