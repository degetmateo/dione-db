create or replace function get_timestamp (_time_zone text) returns timestamp as $$
    begin
        return current_timestamp at time zone _time_zone;
    end;
$$ language plpgsql;