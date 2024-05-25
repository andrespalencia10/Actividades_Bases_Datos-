
SELECT v.id_venta, p.id_producto, c.id_cliente
FROM ventas v
LEFT JOIN productos p ON v.id_producto = p.id_producto
LEFT JOIN clientes c ON v.id_cliente = c.id_cliente
WHERE p.id_producto IS NULL OR c.id_cliente IS NULL;


--valores nulos
SELECT * FROM ventas
WHERE fecha_transaccion IS NULL
   OR id_producto IS NULL
   OR id_cliente IS NULL;


-- rango de fechas
SELECT * FROM ventas
WHERE fecha_transaccion < '2000-01-01' OR fecha_transaccion > CURRENT_DATE;

--  formato de código de producto
SELECT * FROM productos
WHERE codigo_producto NOT LIKE 'PROD-%';




