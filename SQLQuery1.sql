CREATE DATABASE TiendaOnline;
GO

CREATE TABLE DEPARTAMENTO (
    IdDepartamento VARCHAR(5) PRIMARY KEY,
    Descripcion NVARCHAR(100) NOT NULL
);

CREATE TABLE PROVINCIA (
    IdProvincia INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion NVARCHAR(100) NOT NULL,
    IdDepartamento VARCHAR(5) NOT NULL,
    CONSTRAINT FK_Provincia_Departamento
        FOREIGN KEY (IdDepartamento) REFERENCES DEPARTAMENTO(IdDepartamento)
);

CREATE TABLE DISTRITO (
    IdDistrito VARCHAR(10) PRIMARY KEY,
    Descripcion NVARCHAR(100) NOT NULL,
    IdProvincia INT NOT NULL,
    IdDepartamento VARCHAR(5) NOT NULL,
    CONSTRAINT FK_Distrito_Provincia
        FOREIGN KEY (IdProvincia) REFERENCES PROVINCIA(IdProvincia),
    CONSTRAINT FK_Distrito_Departamento
        FOREIGN KEY (IdDepartamento) REFERENCES DEPARTAMENTO(IdDepartamento)
);

CREATE TABLE CATEGORIA (
    IdCategoria INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion NVARCHAR(100) NOT NULL,
    Activo BIT NOT NULL DEFAULT 1
);

CREATE TABLE MARCA (
    IdMarca INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion NVARCHAR(100) NOT NULL,
    Activo BIT NOT NULL DEFAULT 1
);

CREATE TABLE USUARIO (
    IdUsuario INT IDENTITY(1,1) PRIMARY KEY,
    Nombres NVARCHAR(100) NOT NULL,
    Apellidos NVARCHAR(100) NOT NULL,
    Correo NVARCHAR(100) NOT NULL UNIQUE,
    Clave NVARCHAR(200) NOT NULL,
    Restablecer BIT NOT NULL DEFAULT 0,
    Activo BIT NOT NULL DEFAULT 1
);

CREATE TABLE CLIENTE (
    IdCliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombres NVARCHAR(100) NOT NULL,
    Apellidos NVARCHAR(100) NOT NULL,
    Correo NVARCHAR(100) NOT NULL UNIQUE,
    Clave NVARCHAR(200) NOT NULL,
    Restablecer BIT NOT NULL DEFAULT 0
);

CREATE TABLE PRODUCTO (
    IdProducto INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(150) NOT NULL,
    Descripcion NVARCHAR(500),
    IdMarca INT NOT NULL,
    IdCategoria INT NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    RutaImagen NVARCHAR(300),
    NombreImagen NVARCHAR(150),
    Activo BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_Producto_Marca
        FOREIGN KEY (IdMarca) REFERENCES MARCA(IdMarca),
    CONSTRAINT FK_Producto_Categoria
        FOREIGN KEY (IdCategoria) REFERENCES CATEGORIA(IdCategoria)
);


CREATE TABLE CARRITO (
    IdCarrito INT IDENTITY(1,1) PRIMARY KEY,
    IdCliente INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    CONSTRAINT FK_Carrito_Cliente
        FOREIGN KEY (IdCliente) REFERENCES CLIENTE(IdCliente),
    CONSTRAINT FK_Carrito_Producto
        FOREIGN KEY (IdProducto) REFERENCES PRODUCTO(IdProducto)
);

CREATE TABLE VENTA (
    IdVenta INT IDENTITY(1,1) PRIMARY KEY,
    IdCliente INT NOT NULL,
    TotalProducto INT NOT NULL,
    MontoTotal DECIMAL(10,2) NOT NULL,
    Contacto NVARCHAR(100),
    IdDistrito VARCHAR(10) NOT NULL,
    Telefono NVARCHAR(20),
    Direccion NVARCHAR(200),
    FechaVenta DATETIME NOT NULL DEFAULT GETDATE(),
    IdTransaccion NVARCHAR(100),
    CONSTRAINT FK_Venta_Cliente
        FOREIGN KEY (IdCliente) REFERENCES CLIENTE(IdCliente),
    CONSTRAINT FK_Venta_Distrito
        FOREIGN KEY (IdDistrito) REFERENCES DISTRITO(IdDistrito)
);

CREATE TABLE DETALLE_VENTA (
    IdDetalleVenta INT IDENTITY(1,1) PRIMARY KEY,
    IdVenta INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    Total DECIMAL(10,2) NOT NULL,
    IdTransaccion NVARCHAR(100),
    CONSTRAINT FK_DetalleVenta_Venta
        FOREIGN KEY (IdVenta) REFERENCES VENTA(IdVenta),
    CONSTRAINT FK_DetalleVenta_Producto
        FOREIGN KEY (IdProducto) REFERENCES PRODUCTO(IdProducto)
);



