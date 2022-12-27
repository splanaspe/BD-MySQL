--------------------------------------------------------
--PRODUCTO 3

--4d : Mostrar un listado de los proveedores de bebidas
--  a quienes se les haya comprado en los últimos dos meses.
-- intentar pujar al main

SELECT proveedor.empresa AS nombreEmpresa,
compra_producto.NIF AS nif, 
compra_producto.fecha AS fecha_compra
FROM proveedor, compra_producto
WHERE compra_producto.fecha >= adddate(CURDATE(), INTERVAL -2 MONTH)
ORDER BY compra_producto.fecha; 

