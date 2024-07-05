create or replace function membership_deleted () returns trigger as $$
    begin
        update
            discord_server
        set
            user_count = user_count - 1
        where
            id_server = old.id_server;

        perform * from
            membership
        where
            id_user = old.id_user;

        if not found then
            delete from
                discord_user
            where
                id_user = old.id_user;
        end if;

        return old;
    end;
$$ language plpgsql;

create or replace trigger membership_deleted_trigger
after delete on membership
for each row
execute procedure membership_deleted ();