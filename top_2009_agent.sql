-- Which sales agent made the most in sales in 2009?
select SalesAgent
from (select e.firstName || " " || e.lastName as SalesAgent, sum(i.total) Total
    from Employee e
    join Invoice i on i.customerId = c.customerId
    join Customer c on c.SupportRepId = e.EmployeeId
    where strftime('%Y', i.InvoiceDate ) = '2009'
    -- where i.InvoiceDate like '2009%'
    group by e.employeeId
    order by Total desc
)
limit 1
offset 1


With TotalSales as (
    select e.firstName || " " || e.lastName as SalesAgent, sum(i.total) Total
    from Employee e
    join Customer c on c.SupportRepId = e.EmployeeId
    join Invoice i on i.customerId = c.customerId
    where strftime('%Y', i.InvoiceDate ) = '2009'
    group by e.employeeId
)
Select SalesAgent
From TotalSales
where Total = (Select max(Total) from TotalSales )
