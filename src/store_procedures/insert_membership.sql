create or replace function insert_membership (
    _id_user bigint,
    _id_server bigint
) returns void as $$
    begin
        perform * from
            membership
        where
            id_user = _id_user and
            id_server = _id_server;

        if not found then
            insert into
                membership
            values (
                _id_user,
                _id_server
            );
        end if;
    end;
$$ language plpgsql;