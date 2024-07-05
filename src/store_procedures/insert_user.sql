create or replace function insert_user (
    _id_user bigint,
    _id_anilist bigint
) returns void as $$
    begin
        perform * from
            discord_user
        where
            id_user = _id_user;
        
        if not found then
            insert into
                discord_user
            values (
                _id_user,
                _id_anilist
            );
        end if;
    end;
$$ language plpgsql;