-- 5.K. Indicar la cantidad de platos ofertados por tipo de plato.
SELECT tipo_plato.*, COUNT(plato.idTipo) AS cantidad
    FROM tipo_plato
    JOIN plato ON plato.idTipo=tipo_plato.idTipo
    GROUP BY plato.idTipo;
