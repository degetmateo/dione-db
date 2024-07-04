create or replace function insert_error (
    _operation varchar (15),
    _description text
) returns void as $$
    begin
        insert into 
            error (operation, date_error, description) 
        values (
            _operation,
            now(),
            _description
        );

        return;
    end;
$$ language plpgsql;