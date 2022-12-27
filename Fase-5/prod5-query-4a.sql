-- 4A. Crear un procedimiento almacenado que calcule y
-- actualice el precio de compra de cada producto basado
-- en el último precio de compra.

DELIMITER $$
CREATE PROCEDURE actualizaPrecioCompra()
BEGIN
-- Declarations
DECLARE idProduct INT;
DECLARE lastPrice FLOAT;
DECLARE allDone TINYINT DEFAULT 0;
DECLARE curs CURSOR FOR
    SELECT c.idProducto, c.precio
        FROM compra_producto AS c
        WHERE c.fecha=(SELECT MAX(fecha) FROM compra_producto
            WHERE idProducto=c.idProducto);
DECLARE CONTINUE HANDLER FOR NOT FOUND SET allDone = 1;

OPEN curs;
update_loop: LOOP
    FETCH curs INTO idProduct, lastPrice;
    IF allDone THEN
        LEAVE update_loop;
    END IF;
    -- Do the update
    UPDATE producto SET precioCompra = lastPrice WHERE idProducto = idProduct;
END LOOP;
CLOSE curs;

END$$
DELIMITER ;
