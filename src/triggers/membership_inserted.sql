create or replace function membership_inserted () returns trigger as $$
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

create or replace trigger membership_inserted_trigger
after insert on membership
for each row
execute procedure membership_inserted ();