CREATE DATABASE BD_Staging_jardineria;


CREATE TABLE Dim_Producto (
    ID_producto INT PRIMARY KEY,
    CodigoProducto VARCHAR(15) NOT NULL,
    nombre VARCHAR(70) NOT NULL,
    cantidad_en_stock SMALLINT NOT NULL,
    precio_venta NUMERIC(15,2) NOT NULL,
    ID_categoria INT,
 
);

CREATE TABLE Dim_Tiempo (
    fecha_pedido DATE PRIMARY KEY,
    Anio INT,
    Mes INT,
    Dia INT
);


CREATE TABLE Dim_Cliente (
    ID_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    fax VARCHAR(15) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    region VARCHAR(50),
    pais VARCHAR(50)
);

CREATE TABLE Dim_Detalle_Pedido(
  ID_detalle_pedido INTEGER identity(1,1) NOT NULL,
  ID_pedido INTEGER NOT NULL,
  ID_producto INTEGER NOT NULL,
  cantidad INTEGER NOT NULL,
  precio_unidad NUMERIC(15,2) NOT NULL,
  numero_linea SMALLINT NOT NULL,
  PRIMARY KEY (ID_detalle_pedido),
  FOREIGN KEY (ID_producto) REFERENCES Dim_Producto (ID_producto)
);


CREATE TABLE Hecho_Ventas (
    ID_venta INT PRIMARY KEY,
    ID_producto INT,
    ID_cliente INT,
    ID_tiempo DATE,
    cantidad INT,
    precio_unidad NUMERIC(15,2),
    estado VARCHAR(15),
    FOREIGN KEY (ID_producto) REFERENCES Dim_Producto(ID_producto),
    FOREIGN KEY (ID_cliente) REFERENCES Dim_Cliente(ID_cliente),
    FOREIGN KEY (ID_tiempo) REFERENCES Dim_Tiempo(fecha_pedido)
);

--Consultas para traer los datos 
Use jardineria;
Use BD_Staging_jardineria;


INSERT INTO Dim_Detalle_Pedido (ID_pedido, ID_producto, cantidad, precio_unidad,numero_linea)
SELECT ID_pedido, ID_producto, cantidad, precio_unidad,numero_linea
FROM jardineria.dbo.detalle_pedido;

select * from  Dim_Detalle_Pedido;


INSERT INTO Dim_Producto (ID_producto, CodigoProducto, nombre , cantidad_en_stock, precio_venta)
SELECT  ID_producto, CodigoProducto, nombre , cantidad_en_stock, precio_venta
FROM jardineria.dbo.producto;

select * from Dim_Producto;


INSERT INTO Dim_Cliente (ID_cliente, nombre_cliente, telefono, fax, ciudad, region, pais)
SELECT  ID_cliente, nombre_cliente, telefono, fax, ciudad, region, pais
FROM jardineria.dbo.cliente

select * from Dim_Cliente;


