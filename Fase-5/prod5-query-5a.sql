-- 5A. Crear dos disparadores que, al realizar el registro en
-- comanda de un producto o plato, verifique que la cantidad
-- solicitada sea mayor a cero.

DELIMITER $$

-- Necesitamos cuatro triggers: dos para INSERT INTO y dos para UPDATE
-- En ninguno de los cuatro casos se debe aceptar que se introduzcan cantidades
-- nulas o negativas.

-- Evitar inserción en comanda_plato
CREATE TRIGGER comprueba_comanda_plato_insert
BEFORE INSERT ON comanda_plato
FOR EACH ROW
BEGIN
    IF NEW.cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La cantidad debe ser mayor a cero';
    END IF;
END; $$

-- Evitar actualización en comanda_plato
CREATE TRIGGER comprueba_comanda_plato_update
BEFORE UPDATE ON comanda_plato
FOR EACH ROW
BEGIN
    IF NEW.cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La cantidad debe ser mayor a cero';
    END IF;
END; $$

-- Evitar inserción en comanda_elaborado
CREATE TRIGGER comprueba_comanda_elaborado_insert
BEFORE INSERT ON comanda_elaborado
FOR EACH ROW
BEGIN
    IF NEW.cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La cantidad debe ser mayor a cero';
    END IF;
END; $$

-- Evitar actualización en comanda_elaborado
CREATE TRIGGER comprueba_comanda_elaborado_update
BEFORE UPDATE ON comanda_elaborado
FOR EACH ROW
BEGIN
    IF NEW.cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La cantidad debe ser mayor a cero';
    END IF;
END; $$

-- Restablecer el delimitador
DELIMITER ;
