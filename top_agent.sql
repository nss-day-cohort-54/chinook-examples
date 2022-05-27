-- Which sales agent made the most in sales over all?
select max(Total), SalesAgent
from (select e.firstName || " " || e.lastName as SalesAgent, sum(i.total) Total
from Employee e
join Customer c on c.SupportRepId = e.EmployeeId
join Invoice i on i.customerId = c.customerId
group by e.employeeId)

With TotalSales as (
    select e.firstName || " " || e.lastName as SalesAgent, sum(i.total) Total
    from Employee e
    join Customer c on c.SupportRepId = e.EmployeeId
    join Invoice i on i.customerId = c.customerId
    group by e.employeeId
)
Select max(Total), SalesAgent
From TotalSales
