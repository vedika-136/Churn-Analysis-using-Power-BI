create database db_Churn;
use db_Churn;

select * from stg_Churn;

/*how many customers belong to each gender and what percentage of the total customer base each gender represents.*/
select Gender, Count(Gender) as TotalCount,
Count(Gender)* 100.0 / (select Count(*) from stg_Churn) as Percentage
from stg_Churn
Group By Gender;

/* how many customers have each type of contract and what percentage of all customers each contract type represents.*/
select Contract, Count(Contract) as TotalCount,
Count(Contract)* 100.0 / (select Count(*) from stg_Churn) as Percentage
from stg_Churn
Group By Contract;

/* how many customers are in each customer status, how much revenue each status generated, and what percentage of total revenue came from each status group. */
select Customer_Status, count(Customer_Status) as ToatalCount, Sum(Total_Revenue) as TotalRev,
Sum(Total_Revenue)/ (select sum(Total_Revenue) from stg_Churn) * 100 as RevPercentage
from stg_Churn
Group by Customer_Status;

/* how many customers belong to each state, what percentage of all customers come from each state, and then sorts the states from highest to lowest percentage.*/
select state, Count(state) as TotalCount,
Count(state) * 100.0 / (select Count(*) from stg_Churn) as  Percentage
from stg_Churn
Group by state
order by Percentage desc;


select distinct Internet_Type
from stg_Churn;
