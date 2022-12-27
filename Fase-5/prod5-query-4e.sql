-- E : Inventar un procedimiento almacenado que tenga un parámetro de entrada.

-- crearemos procedimiento almacenado que suba los precios de todos los platos y productos elaborados un tanto por ciento.
-- El usuario al llamarlo debe introducir un valor real de 0 a 100 y luego haremos la división por 100

DELIMITER $$
CREATE PROCEDURE subidaPrecios(IN valor FLOAT)
BEGIN
DECLARE valor_porCien FLOAT;

SET valor_porCien = valor/100;

UPDATE comanda_plato
    SET PVP = PVP + PVP*valor_porCien;

UPDATE comanda_elaborado
    SET PVP = PVP + PVP*valor_porCien;

END$$
DELIMITER ;

