with cte as(

    select 
    * 
    from {{ source('uscrime', 'URBAN_CRIME_INCIDENT_LOG') }}
    where city ='New York' and offense_category in ('Theft','Driving Under The Influence') 
)

select offense_category,
       {{get_season('DATE')}} as Season,
       {{get_daytype('DATE')}} as Day_Type,
       count(offense_category)as Number_Offense
       
        from cte
        group by offense_category, Season, Day_Type
        order by Number_Offense desc