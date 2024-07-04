alter table discord_server add constraint discord_server_pk primary key (id_server);
alter table discord_user add constraint discord_user_pk primary key (id_user);

alter table member add constraint member_pk primary key (id_user, id_server);
alter table member add constraint member_user_fk foreign key (id_user) references discord_user (id_user);
alter table member add constraint member_server_fk foreign key (id_server) references discord_server (id_server);

alter table error add constraint error_pk primary key (id_error);