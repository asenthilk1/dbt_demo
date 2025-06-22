with bike_stage as (
select
RIDE_ID ,		
		replace(STARTED_AT,'"','') as STARTED_AT,
		replace (ENDED_AT ,'"','') as ENDED_AT,
		replace(START_STATION_NAME,'"','' ) as START_STATION_NAME,
		START_STATIO_ID ,
		replace(END_STATION_NAME,'"','') as END_STATION_NAME,
		END_STATION_ID ,
		START_LAT ,
		START_LNG ,
		END_LAT ,
		END_LNG ,
		MEMBER_CSUAL 

        from {{ source('demo', 'bike') }}
        where ride_id !='"bikeid"'

)

select * from bike_stage