-- O. Formular una consulta que tenga una agrupación con Group By y un filtraje
--  con Having.
SELECT idCategoria, SUM(precioCompra) AS totalCompras
    FROM producto
    GROUP BY idCategoria
    HAVING  totalCompras > 20;