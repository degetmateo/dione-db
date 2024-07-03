create or replace function user_inserted () returns trigger as $$
    begin
        update
            discord_server
        set
            user_count = user_count + 1
        where
            id_server = new.id_server;

        return new;
    end;
$$ language plpgsql;

create or replace trigger user_inserted_trigger
after insert on discord_user
for each row
execute procedure user_inserted ();