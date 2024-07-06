create table discord_user (
    id_user bigint,
    id_anilist bigint,
    token_anilist text
);

create table discord_server (
    id_server bigint,
    user_count int
);

create table membership (
    id_user bigint,
    id_server bigint
);

create table error (
    id_error int,
    operation varchar (15),
    date_error timestamp,
    description text,
    stack text
);