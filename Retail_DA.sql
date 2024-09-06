select * from retail_data;
-- get top selling items 
select sum(quantity) as qty,product_line from retail_data group by product_line order by qty desc;

-- What is the total revenue by month
select month(date) as month_name,sum(total) as total_revenue from retail_data group by month_name order by total_revenue;

-- What product line had the largest revenue?
select product_line,sum(total) as total_revenue from retail_data group by product_line order by total_revenue desc;

-- What is the city with the largest revenue?
select branch,city,sum(total) as total_revenue from retail_data group by city, branch  order by total_revenue;

-- highest rated product cateogry?
select product_line,avg(rating) as rating_average from retail_data group by product_line order by rating_average desc;

-- Customers--
-- How many unique customer types does the data have?
select distinct customer_type from retail_data;

-- How many unique payment methods does the data have?
select distinct payment from retail_data;

-- What is the most common customer type?
select customer_type,count(*) as cnt from retail_data group by customer_type order by cnt;

-- What is the gender of most of the customers?
select gender,count(*) as gender_c from retail_data group by gender order by gender_c desc;

-- What is the gender distribution per branch?
select gender,count(*) as gender_c from retail_data where branch='C' group by gender order by gender_c desc;
select gender,count(*) as gender_b from retail_data where branch='B' group by gender order by gender_b desc;
select gender,count(*) as gender_a from retail_data where branch='A' group by gender order by gender_a desc;
-- does not provide any significant importance

-- Which day fo the week has the best avg ratings?
select dayofweek(date) as day_of_week,avg(rating) as rating from retail_data group by day_of_week order by rating desc;



-- Sales ---

-- Number of sales made in each time of the day per weekday 
select dayofweek(date) as day_of_week,hour(time) as time_of_day,count(*) as total_sales from retail_data group by day_of_week,time_of_day order by total_sales desc;
-- sales were more in the evening

-- Which of the customer types brings the most revenue?
select customer_type,sum(total) as cnt from retail_data group by customer_type order by cnt desc;

-- Which city has the largest tax percent?
select city,avg(tax_5) as tax from retail_data group by city order by tax desc;