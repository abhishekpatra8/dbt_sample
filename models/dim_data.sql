{{
    config(
        materialized="table"
    )
}}

with get_dates as (

    select * from {{ ref ('stg_dates') }}

),

get_data as (

    select * from {{ ref ('stg_exe_data') }}                

),

final as (

    select distinct ced.theater_name, ced.date_sh, count(distinct(ced.mm_id)) as showtimes, min(ced.time_sh) as first_showtime, max(ced.time_sh) as last_showtime 
    from get_data ced 
    join get_dates cd on ced.date_sh = cd.c_dates
    group by ced.theater_name, ced.date_sh
    order by ced.date_sh

)

select * from final