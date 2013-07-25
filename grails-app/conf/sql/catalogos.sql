--define los roles del sistema
insert into rol (id, version, authority ) values (1, 0, 'ROLE_ADMIN');
insert into rol (id, version, authority ) values (2, 0, 'ROLE_USUARIO');


--usuarios de ejemplo
insert into usuario (id, version, username, "password", enabled, votante, reputacion, account_expired, account_locked, password_expired, nombre, apellido_paterno, apellido_materno, email, fecha_alta) values (1, 0, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', true,true,50, false, false, false, 'Administrador', 'del', 'Sistema', 'administrador@example.com', current_timestamp);
insert into usuario (id, version, username, "password", enabled, votante, reputacion, account_expired, account_locked, password_expired, nombre, apellido_paterno, apellido_materno, email, fecha_alta) values (2, 0, 'user', '5f4dcc3b5aa765d61d8327deb882cf99', true,true,50, false, false, false, 'Usuario', 'del', 'Sistema', 'usuario@example.com', current_timestamp);


--relacion usuario rol
insert into usuario_rol ( rol_id , usuario_id ) values (1,1);
insert into usuario_rol ( rol_id , usuario_id ) values (2,2);


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
insert into requestmap (id, version, url, config_attribute) values (14, 0, '/categoria/**', 'ROLE_ADMIN');

--Categorias
insert into categoria (id, version, nombre) values (1, 0, 'Groovy');
insert into categoria (id, version, nombre) values (2, 0, 'Grails');
insert into categoria (id, version, nombre) values (3, 0, 'Java');


--Datos de prueba que deberan ser eliminados cuando se suba a producción
INSERT INTO post(id, version, categoria_id, descripcion, dueno_id, fecha_cracion,lecturas, resumen, titulo, votos) VALUES (1, 0, 1, 'Twitter Bootstrap es una solución flexible que ofrece muchas más potencia que el CSS normal. Conseguimos una serie de características extras como las declaraciones anidadas, mixins, operaciones y funciones de color. Es fácil de implementar en el código tan sólo incluyendo la declaración en la cabecera y usar los componentes disponibles. La evolución de Bootstrap dentro de Twitter ha sido un trabajo constante para disponer de una herramienta que les permitiera escalar más fácilmente y mantener los proyectos que iban desarrollando. Al principio de todo cada ingeniero usaba cualquier librería con la que estuviera familiarizado lo que producía graves inconsistencias al intentar crecer. Por lo tanto Twitter Bootstrapes un gran ejemplo para todos los desarrolladores que trabajamos en compañías grandes en la que es necesario disponer de un framework uniforme para ir evolucionando. Podéis echar un vistazo a todo el código en la sección que dispone Twitter en GitHub. Allí comprobaréis todo lo los archivos que lo componen por separado: reset.css para eliminar los elementos innecesarios. Variables de color y preboot.less mixins para conseguir gradientes, transparencias y transiciones. Scaffolding.less elementos básicos y globales para generación de grid, diseño estructural y las diferentes plantillas de páginas. type.less con estilos para el cuerpo de textos, listas y tipologías versátiles. pattern.less elementos para navegación, modales, paneles de advertencias… forms.less estilos para los campos de entrada, formularios y estados de validación. tables.less estilos para maquetar datos tabulados.', 1, current_timestamp, 10, 'Twitter Bootstrap es una solución flexible que ofrece muchas más potencia que el CSS normal. Conseguimos una serie de características extras como las declaraciones anidadas, mixins, operaciones y funciones de color. Es fácil de implementar en el código tan sólo incluyendo la declaración en la cabecera y usar los componentes disponibles. La evolución de Bootstrap dentro de Twitter ha sido un trabajo constante para disponer de una herramienta que les permitiera escalar más fácilmente y mantener los proyectos que iban desarrollando. Al principio de todo cada ingeniero usaba cualquier librería con la que estuviera familiarizado lo que producía graves inconsistencias al intentar crecer. Por lo tanto Twitter Bootstrapes un gran ejemplo para todos los desarrolladores que trabajamos en compañías grandes en la que es necesario disponer de un framework uniforme para ir evolucionando. Podéis echar un vistazo a todo el código en la sección que dispone Twitter en GitHub. Allí comprobaréis todo lo los archivos que lo componen por separado:', 'Como utilizar el Bootstrap de twitter en Grails', 10);

