--4E. Inventar una consulta que contenga un group by + having + agregació (count).

SELECT idCategoria, COUNT(precioCompra) 
AS cantidadTotal FROM producto
	GROUP BY idCategoria, precioCompra
    HAVING precioCompra < 20;
