create or replace function insert_suggestion (
    _id_user bigint,
    _description text
) returns void as $$
    declare
        nueva_id int;
    begin
        select coalesce (max (id_suggestion), 0) + 1 into nueva_id from suggestion;

        insert into 
            suggestion
        values (
            nueva_id,
            _id_user,
            get_timestamp('America/Buenos_Aires'),
            _description
        );

        return;
    end;
$$ language plpgsql;