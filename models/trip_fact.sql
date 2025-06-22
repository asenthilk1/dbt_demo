  with TRIPS as (

    select
    RIDE_ID,
   -- RIDEABLE_TYPE,
    DATE(TO_TIMESTAMP(STARTED_AT)) as TRIP_DATE,
    START_STATIO_ID as START_STATION_ID,
    END_STATION_ID,
    MEMBER_CSUAL AS MEMBER_CASUAL,
    TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS
    from {{ ref('stage_bike') }}
    where started_at != 'starttime'
--limit 10
)
select 
*
from TRIPS