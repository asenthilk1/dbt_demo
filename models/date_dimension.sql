WITH CTE AS (
select to_timestamp(started_at) as started_at,
DATE( to_timestamp(started_at)) DATE_STARTED_AT,
HOUR( to_timestamp(started_at)) HOUR_STARTED_AT,
CASE 
WHEN DAYNAME(DATE( to_timestamp(started_at))) in ('SAT','SUN')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END AS DAY_TYPE,
CASE WHEN MONTH (to_timestamp(started_at)) in (12,1,2)
THEN 'WINTER'
WHEN MONTH (to_timestamp(started_at)) in (3,4,5)
THEN 'SPRING'
WHEN MONTH (to_timestamp(started_at)) in (6,7,8)
THEN 'SUMMER'
ELSE 'AUTUMN'
END AS STATION_OF_YEAR
from {{ source('demo', 'bike') }}
where started_at != 'started_at'
)

select * from CTE