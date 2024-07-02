drop table if exists discord_server;
create table discord_server (
    id_server bigint,
    user_count int
);

alter table discord_server add constraint discord_server_pk primary key (id_server);

drop table if exists discord_user;
create table discord_user (
    id_user bigint,
    id_server bigint,
    id_anilist bigint
);

alter table discord_user add constraint discord_user_pk primary key (id_user, id_server);
alter table discord_user add constraint discord_user_fk foreign key (id_server) references discord_server (id_server);