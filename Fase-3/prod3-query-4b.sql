
--4A. Mostrar el nombre de cada plato y la última fecha en la que ha sido solicitado.

--Entiendo que la 4B es una continuación de la 4A.
--4B. Ordenar el listado por tipo de plato.

SELECT plato.idPlato, plato.nombre, plato.idTipo, MAX(fecha_plato_id.Fecha)
FROM tipo_plato,
	(SELECT idPlato, fecha_plato.fecha
	FROM 
		  (SELECT idComanda, fecha FROM comanda) AS fecha_plato
	JOIN comanda_plato ON fecha_plato.idComanda = comanda_plato.idComanda) 
       AS fecha_plato_id	
JOIN plato ON fecha_plato_id.idPlato = plato.idPlato
GROUP BY plato.idPlato
ORDER BY plato.idTipo;

