-- PRODUCTO 2. Punto 5. Realizar las siguientes consultas:
-- M. Contar el total de donaciones por producto.
-- QUERY que cumple el enunciado:
SELECT idProducto, COUNT(*)
    FROM detalle_donacion
    GROUP BY idProducto;

-- Con más información
SELECT 	producto.idProducto,
        producto.nombre,
        COUNT(*) AS numDonaciones,
        SUM(cantidad) AS cantidad
    FROM detalle_donacion
    JOIN producto
    ON detalle_donacion.idProducto=producto.idProducto
    GROUP BY idProducto;
