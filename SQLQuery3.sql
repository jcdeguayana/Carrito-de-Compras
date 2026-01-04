INSERT INTO USUARIO (Nombres, Apellidos, Correo, Clave, Restablecer, Activo)
VALUES
('Juan', 'Muñoz', 'juan@mail.com', '123456', 0, 1),
('Admin', 'Sistema', 'admin@mail.com', 'admin123', 0, 1);


INSERT INTO MARCA (Descripcion, Activo)
VALUES
('Samsung', 1),
('Apple', 1),
('Sony', 1),
('LG', 1);

INSERT INTO CATEGORIA (Descripcion, Activo)
VALUES
('Celulares', 1),
('Televisores', 1),
('Accesorios', 1),
('Computación', 1);


SELECT * FROM USUARIO;
SELECT * FROM MARCA;
SELECT * FROM CATEGORIA;

SELECT IdMarca, Descripcion, Activo FROM MARCA;


SELECT IdCategoria, Descripcion, Activo FROM CATEGORIA

SELECT @@SERVERNAME;
