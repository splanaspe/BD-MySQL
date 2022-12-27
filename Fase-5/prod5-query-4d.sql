--4D. Inventar una función que brinde algún tipo de información sobre las ventas del día.
-- Función que dice el número de comensales que ha habido en un día

DELIMITER $$
CREATE FUNCTION numeroComensalesDia(dia DATE)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE comensales INT;
SET comensales = (SELECT SUM(comensales) FROM comanda AS c
                  WHERE c.fecha = dia);
RETURN comensales;
END $$
DELIMITER ;