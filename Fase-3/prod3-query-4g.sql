-- 4G. Realizar una consulta de UNIÓN para mostrar los platos y productos solicitados en cada comanda.
-- Datos que devuelve:
    -- id de comanda,
    -- la palabra 'plato' o 'elaborado',
    -- la id (de producto o de plato),
    -- el nombre (del plato o del producto)
    -- la cantidad (del plato o del producto)

SELECT  cp.idComanda, 'plato' AS tipo, cp.idPlato AS id,pl.nombre, cp.cantidad
    FROM comanda_plato AS cp
    JOIN plato AS pl
    ON cp.idPlato=pl.idPlato
UNION ALL
SELECT  ce.idComanda, 'elaborado', ce.idProducto, pr.nombre, ce.cantidad
    FROM comanda_elaborado AS ce
    JOIN producto AS pr
    ON ce.idProducto=pr.idProducto
ORDER BY idComanda;
