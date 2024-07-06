create or replace function insert_user (
    _id_user bigint,
    _id_anilist bigint,
    _token_anilist text
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
                _id_anilist,
                _token_anilist
            );
        else
            update
                discord_user
            set
                id_anilist = _id_anilist,
                token_anilist = _token_anilist
            where
                id_user = _id_user;
        end if;
    end;
$$ language plpgsql;