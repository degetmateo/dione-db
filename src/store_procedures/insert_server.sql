create or replace function insert_server (
    _id_server bigint
) returns void as $$
    begin
        perform * from
            discord_server
        where
            id_server = _id_server;

        if not found then
            insert into
                discord_server
            values (
                _id_server,
                0
            );
        end if;
    end;
$$ language plpgsql;