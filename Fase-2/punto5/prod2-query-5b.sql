-- PRODUCTO 2
-- 5. Realizar las siguientes consultas:
-- B. Listar todos los productos ordenados por la categoría a la cual pertenecen.

SELECT producto.idProducto, producto.nombre, categoria.categoria
    FROM producto
    INNER JOIN categoria ON categoria.idCategoria=producto.idCategoria
    ORDER BY categoria.categoria ASC;
