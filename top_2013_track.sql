-- Provide a query that shows the most purchased track(s) of 2013.
select Name, max(TrackSales)
from (
    select t.name Name, count(t.trackId) as TrackSales
    from InvoiceLine il
    join Track t on t.trackId = il.trackId
    join invoice i on i.invoiceId = il.invoiceId
    where i.invoiceDate like '2013%'
    group by t.name
    order by TrackSales desc
)
