-- 5.E. Listar las compras realizadas durante el mes en curso.
SELECT * FROM compra_producto
    WHERE MONTH(fecha) = MONTH(CURRENT_DATE);