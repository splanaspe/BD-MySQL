-- H. Mostrar los productos que contengan alérgenos.

SELECT * FROM producto AS p
	JOIN alergeno_producto AS ap
	ON p.idProducto=ap.idProducto;
