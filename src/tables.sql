create table discord_user (
    id_user bigint,
    id_server bigint,
    id_anilist bigint
);

create table discord_server (
    id_server bigint,
    user_count int
);

create table error (
    id_error serial primary key,
    operation varchar (15),
    date_error timestamp,
    description text,
);