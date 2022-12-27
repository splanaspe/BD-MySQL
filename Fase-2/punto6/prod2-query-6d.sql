-- 6.D. Eliminar aquellas CATEGORÍAS que no tengan PROVEEDORES.

-- Primera versión. Provoca errores de integridad.
DELETE FROM categoria WHERE idCategoria NOT IN
	(SELECT idCategoria FROM proveedor_categoria);

-- Segunda versión. También problemática.
DELETE FROM categoria
    WHERE idCategoria NOT IN
    (SELECT idCategoria FROM proveedor_categoria)
    AND idCategoria NOT IN
    (SELECT idCategoria FROM producto);

-- Propuesta útil. Saber (sin borrar) las categorías sin proveedor
SELECT * FROM categoria
    WHERE idCategoria NOT IN
    (SELECT idCategoria FROM proveedor_categoria);

-- Todavía más útil. Saber (sin borrar) las categorías de productos sin proveedor
SELECT * FROM categoria
    WHERE idCategoria NOT IN
    (SELECT idCategoria FROM proveedor_categoria)
    AND idCategoria IN
    (SELECT idCategoria FROM producto);
