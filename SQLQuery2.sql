CREATE PROCEDURE sp_RegistrarUsuario
    @Nombres VARCHAR(100),
    @Apellidos VARCHAR(100),
    @Correo VARCHAR(100),
    @Clave VARCHAR(100),
    @Activo BIT,
    @Resultado INT OUTPUT,
    @Mensaje VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM USUARIO WHERE Correo = @Correo)
    BEGIN
        SET @Resultado = 0;
        SET @Mensaje = 'El correo ya se encuentra registrado';
        RETURN;
    END

    INSERT INTO USUARIO (Nombres, Apellidos, Correo, Clave, Restablecer, Activo)
    VALUES (@Nombres, @Apellidos, @Correo, @Clave, 0, @Activo);

    SET @Resultado = SCOPE_IDENTITY();
    SET @Mensaje = 'Usuario registrado correctamente';
END

GO

CREATE PROCEDURE sp_EditarUsuario
    @IdUsuario INT,
    @Nombres VARCHAR(100),
    @Apellidos VARCHAR(100),
    @Correo VARCHAR(100),
    @Activo BIT,
    @Resultado BIT OUTPUT,
    @Mensaje VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM USUARIO WHERE IdUsuario = @IdUsuario)
    BEGIN
        SET @Resultado = 0;
        SET @Mensaje = 'El usuario no existe';
        RETURN;
    END

    IF EXISTS (
        SELECT 1 
        FROM USUARIO 
        WHERE Correo = @Correo AND IdUsuario <> @IdUsuario
    )
    BEGIN
        SET @Resultado = 0;
        SET @Mensaje = 'El correo ya pertenece a otro usuario';
        RETURN;
    END

    UPDATE USUARIO
    SET 
        Nombres = @Nombres,
        Apellidos = @Apellidos,
        Correo = @Correo,
        Activo = @Activo
    WHERE IdUsuario = @IdUsuario;

    SET @Resultado = 1;
    SET @Mensaje = 'Usuario actualizado correctamente';
END

GO

CREATE PROCEDURE sp_RegistrarMarca
    @Descripcion VARCHAR(100),
    @Activo BIT,
    @Resultado INT OUTPUT,
    @Mensaje VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM MARCA WHERE Descripcion = @Descripcion)
    BEGIN
        SET @Resultado = 0;
        SET @Mensaje = 'La marca ya existe';
        RETURN;
    END

    INSERT INTO MARCA (Descripcion, Activo)
    VALUES (@Descripcion, @Activo);

    SET @Resultado = SCOPE_IDENTITY();
    SET @Mensaje = 'Marca registrada correctamente';
END

GO

CREATE PROCEDURE sp_EditarMarca
    @IdMarca INT,
    @Descripcion VARCHAR(100),
    @Activo BIT,
    @Resultado BIT OUTPUT,
    @Mensaje VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM MARCA WHERE IdMarca = @IdMarca)
    BEGIN
        SET @Resultado = 0;
        SET @Mensaje = 'La marca no existe';
        RETURN;
    END

    IF EXISTS (
        SELECT 1 
        FROM MARCA 
        WHERE Descripcion = @Descripcion AND IdMarca <> @IdMarca
    )
    BEGIN
        SET @Resultado = 0;
        SET @Mensaje = 'Ya existe otra marca con esa descripción';
        RETURN;
    END

    UPDATE MARCA
    SET 
        Descripcion = @Descripcion,
        Activo = @Activo
    WHERE IdMarca = @IdMarca;

    SET @Resultado = 1;
    SET @Mensaje = 'Marca actualizada correctamente';
END

GO
CREATE PROCEDURE sp_EliminarMarca
    @IdMarca INT,
    @Resultado BIT OUTPUT,
    @Mensaje VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM MARCA WHERE IdMarca = @IdMarca)
    BEGIN
        SET @Resultado = 0;
        SET @Mensaje = 'La marca no existe';
        RETURN;
    END

    -- Si querés validar relaciones (ej: productos asociados), avisame y lo sumamos

    DELETE FROM MARCA WHERE IdMarca = @IdMarca;

    SET @Resultado = 1;
    SET @Mensaje = 'Marca eliminada correctamente';
END

GO

CREATE PROCEDURE sp_RegistrarCategoria
    @Descripcion VARCHAR(100),
    @Activo BIT,
    @Resultado INT OUTPUT,
    @Mensaje VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM CATEGORIA WHERE Descripcion = @Descripcion)
    BEGIN
        SET @Resultado = 0;
        SET @Mensaje = 'La categoría ya existe';
        RETURN;
    END

    INSERT INTO CATEGORIA (Descripcion, Activo)
    VALUES (@Descripcion, @Activo);

    SET @Resultado = SCOPE_IDENTITY();
    SET @Mensaje = 'Categoría registrada correctamente';
END

GO

CREATE PROCEDURE sp_EditarCategoria
    @IdCategoria INT,
    @Descripcion VARCHAR(100),
    @Activo BIT,
    @Resultado BIT OUTPUT,
    @Mensaje VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM CATEGORIA WHERE IdCategoria = @IdCategoria)
    BEGIN
        SET @Resultado = 0;
        SET @Mensaje = 'La categoría no existe';
        RETURN;
    END

    IF EXISTS (
        SELECT 1 
        FROM CATEGORIA 
        WHERE Descripcion = @Descripcion AND IdCategoria <> @IdCategoria
    )
    BEGIN
        SET @Resultado = 0;
        SET @Mensaje = 'Ya existe otra categoría con esa descripción';
        RETURN;
    END

    UPDATE CATEGORIA
    SET 
        Descripcion = @Descripcion,
        Activo = @Activo
    WHERE IdCategoria = @IdCategoria;

    SET @Resultado = 1;
    SET @Mensaje = 'Categoría actualizada correctamente';
END

GO

CREATE PROCEDURE sp_EliminarCategoria
    @IdCategoria INT,
    @Resultado BIT OUTPUT,
    @Mensaje VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM CATEGORIA WHERE IdCategoria = @IdCategoria)
    BEGIN
        SET @Resultado = 0;
        SET @Mensaje = 'La categoría no existe';
        RETURN;
    END

    -- Validación opcional: productos asociados
    IF EXISTS (SELECT 1 FROM PRODUCTO WHERE IdCategoria = @IdCategoria)
    BEGIN
        SET @Resultado = 0;
        SET @Mensaje = 'No se puede eliminar la categoría porque tiene productos asociados';
        RETURN;
    END

    DELETE FROM CATEGORIA WHERE IdCategoria = @IdCategoria;

    SET @Resultado = 1;
    SET @Mensaje = 'Categoría eliminada correctamente';
END







