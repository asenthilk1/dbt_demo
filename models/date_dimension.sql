WITH CTE AS (
select to_timestamp(started_at) as started_at,
DATE( to_timestamp(started_at)) DATE_STARTED_AT,
HOUR( to_timestamp(started_at)) HOUR_STARTED_AT,
{{get_daytype('started_at')}} DAY_TYPE,
{{get_season('started_at') }} STATION_OF_YEAR
from {{ source('demo', 'bike') }}
where started_at != 'started_at'
)
select * from CTE