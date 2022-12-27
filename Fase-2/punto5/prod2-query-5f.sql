-- 5. Realizar las siguientes consultas y anotar la sentencia SQL y su salida en
--  un documento:
-- F. Indicar el número de platos de ensalada registrados.

SELECT COUNT(idPlato) FROM plato
    WHERE idTipo = 3;

