-- PRODUCTO 2

-- 6. Realizar las siguientes modificaciones en los datos insertados y anotar la
--  sentencia SQL y su salida en un documento:
-- A. Actualizar el campo Porcentaje_Merma con la división de la Cantidad_Neta
--  entre la Cantidad_Bruta en la tabla INGREDIENTES_PLATO.

UPDATE ingrediente_plato
    SET porcentajeMerma=cantNeta/cantBruta;
