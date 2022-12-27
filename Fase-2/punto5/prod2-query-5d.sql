-- 5.D. Hacer una relación de los proveedores de Verduras y Hortalizas.
SELECT * FROM proveedor AS p
	JOIN proveedor_categoria AS pc
    ON p.NIF=pc.NIFProveedor
    WHERE pc.idCategoria=6;