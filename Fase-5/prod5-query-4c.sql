-- 4C. Crear una función que calcule el stock actual de un producto,
-- basado en las comandas y donaciones.

DELIMITER $$
CREATE FUNCTION get_stock_by_id(id INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE stock_final INT DEFAULT 0;
DECLARE stock_inicial INT DEFAULT 0;
DECLARE compras INT DEFAULT 0;
DECLARE donaciones INT DEFAULT 0;
DECLARE comandas INT DEFAULT 0;
SET stock_inicial = (SELECT COALESCE(stock, 0) FROM producto
                    WHERE producto.idProducto = id);
SET compras = (SELECT COALESCE(SUM(cantidad), 0) FROM compra_producto
                WHERE compra_producto.idProducto = id);
SET donaciones = (SELECT COALESCE(SUM(cantidad), 0) FROM detalle_donacion
                WHERE detalle_donacion.idProducto = id);
SET comandas = (SELECT COALESCE(SUM(cantidad), 0) FROM comanda_elaborado
                WHERE comanda_elaborado.idProducto = id);
SET stock_final = stock_inicial + compras - donaciones - comandas;
RETURN stock_final;
END$$
DELIMITER ;