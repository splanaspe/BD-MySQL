-- (B. Listar todos los productos ordenados por la categoría a la cual pertenecen.)
-- C. Mostrar en el listado (del punto B) la categoría, código, nombre y alerta_stock.

SELECT idCategoria, idProducto, nombre, alertaStock
    FROM producto
    ORDER BY idCategoria;
