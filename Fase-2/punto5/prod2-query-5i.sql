-- I. Reportar el total de compras en € realizadas a cada proveedor. La consulta
--  deberá tener los campos: Empresa, Número de productos y Total Euros.
SELECT  proveedor.NIF,
        proveedor.empresa,
        COUNT(*) AS numProductos,
        SUM(cantidad) AS cantidadProductos,
        ROUND(SUM(precio*cantidad), 2) AS totalEuros
FROM compra_producto
    JOIN proveedor ON compra_producto.NIF=proveedor.NIF
    GROUP BY compra_producto.NIF
    -- Añadido el orden alfabético de empresas por mayor utilidad:
    ORDER BY proveedor.empresa;