create or replace function user_deleted () returns trigger as $$
    begin
        update
            discord_server
        set
            user_count = user_count - 1
        where
            id_server = old.id_server;

        return old;
    end;
$$ language plpgsql;

create or replace trigger user_deleted_trigger
after delete on discord_user
for each row
execute procedure user_deleted ();