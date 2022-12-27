-- PRODUCTO 2
-- 5. Realizar las siguientes consultas y anotar la sentencia SQL y su salida en
--  un documento:
-- J. Indicar aquellos productos que han cambiado de precio.

SELECT p.idProducto, p.nombre, p.precioCompra, c.precio
    FROM producto AS p
    INNER JOIN compra_producto AS c ON p.idProducto = c.idProducto
    WHERE p.precioCompra != c.precio;
