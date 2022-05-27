select max(total), Name
from (

select m.name, count(m.mediaTypeId) as total
from MediaType m
join Track t on t.mediaTypeId = m.mediaTypeId
join InvoiceLine il on il.trackId = t.trackId
group by m.Name
)
