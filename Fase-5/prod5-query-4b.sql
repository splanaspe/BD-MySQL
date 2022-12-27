--4B. Crear un procedimiento almacenado que genere
--automáticamente las donaciones del día. La política
--de la Rosticería es donar a comedores sociales aquellos
--productos con fecha de caducidad igual a la de la fecha en curso.

DELIMITER $$
CREATE PROCEDURE genera_donacion_hoy()
BEGIN
-- Declarations
DECLARE today DATE DEFAULT CURRENT_DATE();
DECLARE total, idProd, quantity INT;
DECLARE allDone TINYINT DEFAULT 0;
DECLARE lineNum INT;
DECLARE curs CURSOR FOR
    SELECT idProducto, cantidad FROM compra_producto WHERE caducidad = today;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET allDone = 1;

-- Check if there are products to donate
SET total = (SELECT COUNT(*) FROM compra_producto WHERE caducidad = today);

IF total > 0 THEN
    -- Create donation
    INSERT INTO donacion (fecha) VALUES (today);

    -- Get counter for line numbers
    SET lineNum = (SELECT MAX(linea) FROM detalle_donacion);

    -- Create donation lines for every product
    OPEN curs;

    insert_loop: LOOP
        -- Fetch a row, if any
        FETCH curs INTO idProd, quantity;
        IF allDone THEN
            LEAVE insert_loop;
        END IF;
        -- Do the insert
        SET lineNum = lineNum + 1;
        INSERT INTO detalle_donacion (fecha, linea, idProducto, cantidad)
            VALUES (today, lineNum, idProd, quantity);
    END LOOP;

    CLOSE curs;
END IF;
END $$
DELIMITER ;