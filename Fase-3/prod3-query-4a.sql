--4A. Mostrar el nombre de cada plato y la última fecha en la que ha sido solicitado.

SELECT plato.idPlato, plato.nombre, (SELECT MAX(fecha) FROM comanda)
FROM plato
INNER JOIN comanda_plato
ON plato.idPlato=comanda_plato.idPlato
INNER JOIN comanda
ON comanda_plato.idComanda=comanda.idComanda
