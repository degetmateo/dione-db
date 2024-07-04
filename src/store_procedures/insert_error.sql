create or replace function insert_error (
    _operation varchar (15),
    _description text
) returns void as $$
    declare
        id int;
    begin
        select coalesce (max (id_error), 0) + 1 into id from error;

        insert into error values (
            id,
            _operation,
            now(),
            _description
        );

        return;
    end;
$$ language plpgsql;