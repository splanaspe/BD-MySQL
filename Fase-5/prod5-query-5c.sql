--5C. Inventar y justificar un disparador.

-- Realizar un disparador que reste del stock de un elaborado en cuanto se
-- realiza una comanda.
-- (Sería un método alternativo al ejercicio 4C, que usaba un procedimiento)

CREATE TRIGGER update_stock
AFTER INSERT ON comanda_elaborado
FOR EACH ROW
    UPDATE producto SET stock = stock - NEW.cantidad
    WHERE idProducto = NEW.idProducto;