-- 6. E. Borrar los productos elaborados que nunca se hayan vendido. Para ello
--  deberás revisar la tabla COMANDA_ELABORADOS.

-- Esta consulta no se debería hacer, porque destruye información
DELETE FROM producto
    WHERE idProducto IN
      (SELECT idProducto FROM elaborado)
    AND idProducto NOT IN
      (SELECT idProducto FROM comanda_elaborado);

-- Se podría hacer esto otro. No lo ejecutamos porque el enunciado no lo pide:
--  * Añadir un campo booleano en la tabla elaborado, igual que está en plato.
--  * Hacer una modificación que ponga en FALSE ese campo en los elaborados que
--    nunca se han pedido.

-- ALTER TABLE elaborado ADD COLUMN enMenu BOOLEAN DEFAULT TRUE;
-- UPDATE elaborado SET enMenu=FALSE
--     WHERE idProducto NOT IN
--     (SELECT idProducto FROM comanda_elaborado);

