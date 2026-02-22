create database db_Churn;
use db_Churn;

select * from stg_Churn;


select Gender, Count(Gender) as TotalCount,
Count(Gender)* 100.0 / (select Count(*) from stg_Churn) as Percentage
from stg_Churn
Group By Gender;


select Contract, Count(Contract) as TotalCount,
Count(Contract)* 100.0 / (select Count(*) from stg_Churn) as Percentage
from stg_Churn
Group By Contract;


select Customer_Status, count(Customer_Status) as ToatalCount, Sum(Total_Revenue) as TotalRev,
Sum(Total_Revenue)/ (select sum(Total_Revenue) from stg_Churn) * 100 as RevPercentage
from stg_Churn
Group by Customer_Status;


select state, Count(state) as TotalCount,
Count(state) * 100.0 / (select Count(*) from stg_Churn) as  Percentage
from stg_Churn
Group by state
order by Percentage desc;


select distinct Internet_Type
from stg_Churn;
