SELECT * FROM tutorial.aapl_historical_stock_price

---To find out which column has he most null values
SELECT COUNT(year) AS year,
       COUNT(month) AS month,
       COUNT(open) AS open,
       COUNT(high) AS high,
       COUNT(low) AS low,
       COUNT(close) AS close,
       COUNT(volume) AS volume
  FROM tutorial.aapl_historical_stock_price
  
---Calculating the average opening price
SELECT SUM(open)/COUNT(open) AS avg_open_price
  FROM tutorial.aapl_historical_stock_price
 
 ---To determine Apples lowest stock price
 SELECT MIN(low)
  FROM tutorial.aapl_historical_stock_price
  
  ---The highest single-day increase in Apples share value
  SELECT MAX(close - open)
  FROM tutorial.aapl_historical_stock_price
  
  ---Average daily trade volume for apple stock
  SELECT AVG(volume) AS avg_volume
  FROM tutorial.aapl_historical_stock_price
  
  ----The highest and lowest prices that Apple stock achieved each month
  SELECT year,
       month,
       MIN(low) AS lowest_price,
       MAX(high) AS highest_price
  FROM tutorial.aapl_historical_stock_price
 GROUP BY 1, 2
 ORDER BY 1, 2