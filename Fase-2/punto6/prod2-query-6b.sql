-- 6. B. Cambiar la fecha de caducidad de los productos, sumándole 7 días.
UPDATE compra_producto
    SET caducidad = DATE_ADD(caducidad, INTERVAL 7 DAY);

