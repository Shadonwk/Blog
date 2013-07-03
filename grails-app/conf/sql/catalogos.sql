--define los roles del sistema
insert into rol (id, version, authority ) values (1, 0, 'ROLE_ADMIN');
insert into rol (id, version, authority ) values (2, 0, 'ROLE_USUARIO');


--usuarios de ejemplo
insert into usuario (id, version, username, "password", enabled, votante, reputacion, account_expired, account_locked, password_expired, nombre, apellido_paterno, apellido_materno, email, fecha_alta) values (1, 0, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 1,1,50, 0, 0, 0, 'Administrador', 'del', 'Sistema', 'administrador@example.com', current_timestamp);
insert into usuario (id, version, username, "password", enabled, votante, reputacion, account_expired, account_locked, password_expired, nombre, apellido_paterno, apellido_materno, email, fecha_alta) values (2, 0, 'user', '5f4dcc3b5aa765d61d8327deb882cf99', 1,1,50, 0, 0, 0, 'Usuario', 'del', 'Sistema', 'usuario@example.com', current_timestamp);


--relacion usuario rol
insert into usuario_rol ( rol_id , usuario_id ) values (1,1)
insert into usuario_rol ( rol_id , usuario_id ) values (2,2)


insert into requestmap (id, version, url, config_attribute) values (1, 0, '/admin/dbconsole/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (2, 0, '/js/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (3, 0, '/css/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (4, 0, '/images/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (5, 0, '/login/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (6, 0, '/logout/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (7, 0, '/', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (8, 0, '/*', 'IS_AUTHENTICATED_FULLY');
-- Permisos para los usuarios
insert into requestmap (id, version, url, config_attribute) values (9, 0, '/usuario/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (10, 0, '/blog/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (11, 0, '/post/**', 'ROLE_ADMIN, ROLE_USUARIO');
insert into requestmap (id, version, url, config_attribute) values (12, 0, '/post/show/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (13, 0, '/comentario/**', 'ROLE_USUARIO, ROLE_ADMIN');



