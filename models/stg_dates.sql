with get_final_dates as (
                        select 
                            id,
                            c_dates
                        from {{ source('check_date', 'check_dates') }}
                    )

select * from get_final_dates