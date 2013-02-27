insert into requestmap (id, version, url, config_attribute) values (1, 0, '/admin/dbconsole/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (2, 0, '/js/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (3, 0, '/css/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (4, 0, '/images/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (5, 0, '/login/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (6, 0, '/logout/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (7, 0, '/', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (8, 0, '/*', 'IS_AUTHENTICATED_FULLY');
-- Permisos para los usuarios
insert into requestmap (id, version, url, config_attribute) values (9, 0, '/usuario/**', 'ROLE_ADMIN, ROLE_USUARIO');
insert into requestmap (id, version, url, config_attribute) values (10, 0, '/blog/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (11, 0, '/post/**', 'ROLE_ADMIN');
insert into requestmap (id, version, url, config_attribute) values (12, 0, '/post/show/**', 'IS_AUTHENTICATED_ANONYMOUSLY');
insert into requestmap (id, version, url, config_attribute) values (13, 0, '/comentario/**', 'ROLE_USUARIO, ROLE_ADMIN');



