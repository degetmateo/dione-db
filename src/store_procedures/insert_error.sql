create or replace function insert_error (
    _operation varchar (15),
    _description text,
    _stack text
) returns void as $$
    declare
        nueva_id int;
    begin
        select coalesce (max (id_error), 0) + 1 into nueva_id from error;

        insert into 
            error
        values (
            nueva_id,
            _operation,
            now(),
            _description,
            _stack
        );

        return;
    end;
$$ language plpgsql;