with get_final_data as (
                    select 
                        circuit_name,
                        theater_name,
                        theater_address,
                        theater_city,
                        theater_state,
                        theater_zip,
                        country,
                        title,
                        date_sh,
                        time_sh,
                        auditorium,
                        studio_name,
                        release_date,
                        rating,
                        genre,
                        runtime, 
                        mm_id
                    from {{ source('check_date', 'check_exe_data') }}
                )

select * from get_final_data