create or replace function membership_deleted () returns trigger as $$
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

create or replace trigger membership_deleted_trigger
after delete on membership
for each row
execute procedure membership_deleted ();