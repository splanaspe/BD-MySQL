--4F. Inventar una consulta que contenga una combinación externa + ordenación (order by).


-- La idea es mostrar las veces que se ha vendido cada plato ordenados por precio.

SELECT plato.nombre AS Platos_vendidos,
plato.idplato AS Plato_ID,
plato.PVP AS PVP
FROM plato
LEFT JOIN comanda_plato
ON comanda_plato.idPlato = plato.idPlato
ORDER BY plato.PVP DESC;

