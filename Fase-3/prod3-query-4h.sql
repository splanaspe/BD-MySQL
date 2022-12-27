--4H. Guardar la consulta anterior como una vista.

CREATE VIEW items_comanda AS
SELECT  cp.idComanda,
        'plato' AS tipo,
        cp.idPlato AS id,
        pl.nombre,
        cp.cantidad
    FROM comanda_plato AS cp
    JOIN plato AS pl
    ON cp.idPlato=pl.idPlato
UNION ALL
SELECT  ce.idComanda,
        'elaborado',
        ce.idProducto,
        pr.nombre,
        ce.cantidad
    FROM comanda_elaborado AS ce
    JOIN producto AS pr
    ON ce.idProducto=pr.idProducto
ORDER BY idComanda;

-- Ejemplos para consultar la vista:
--    SELECT * FROM items_comanda;
--    SELECT * FROM items_comanda WHERE idComanda=29;