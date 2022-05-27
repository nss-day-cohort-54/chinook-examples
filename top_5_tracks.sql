-- Provide a query that shows the top 5 most purchased tracks over all.
Select t.name TrackName, count(t.TrackId) as TotalSales
from Track t
join InvoiceLine il on t.trackId = il.trackId
group by TrackName
order by TotalSales
limit 5
