--------------------------------------------------------------------------------
-- PRODUCTO 2

--------------------------------------------------------------------------------
-- 4. Insertar los registros de PRODUCTOS y COMPRAS que el consultor facilitará
--  vía tablón. Para ello, deberéis repartir la información de la tabla de
--  productos, en las diferentes tablas de la Base de Datos según corresponda y
--  posteriormente insertar los registros de compras de la tabla .csv.

-- Primer paso: filtrar manualmente los datos brutos para ajustarlos a los
--  campos y tipos de nuestra BD

-- Segundo paso: Insertar los datos en la tabla producto
INSERT INTO producto (idProducto, nombre, unidad, alertaStock, idCategoria)
VALUES
(2001, "Pechuga marinada",                          "Kilogramos",  30,  2),
(1101, "Sal de Himalaya",                           "Kilogramos",   2, 11),
(1102, "Pimienta dulce",                            "Kilogramos",   5, 11),
(1103, "Hierbas provenzales",                       "Kilogramos",   5, 11),
(1104, "Orégano (bis)",                             "Kilogramos",   5, 11),
(1105, "Romero (bis)",                              "Kilogramos",   2, 11),
(1106, "Laurel en hojas",                           "Kilogramos",   5, 11),
(1107, "Ajo (bis)",                                 "Kilogramos",  10, 11),
(1002, "Aceite de maíz",                            "Litros",      20,  1),
(6005, "Malla de Limón (500gr)",                    "Unidades",    36,  6),
(1607, "Harina de trigo (1 kg)",                    "Unidades",   240, 16),
(1701, "Salsa Worcester",                           "Unidades",   360, 17),
(1501, "Copa de nata con café",                     "Unidades",    70, 15),
(1502, "Flan de huevo (100g)",                      "Unidades",    70, 15),
(4001, "Cápsulas de cafè cappuccino (16 cápsulas)", "Unidades",    20,  4);

-- Tercer paso: Insertar los datos en la tabla ingrediente
INSERT INTO ingrediente (idProducto, conservacion)
VALUES
    (2001, "Guardar limpio en el refrigerador en bolsas de congelación"),
    (1101, "Guardar en un lugar seco"),
    (1102, "Guardar en un lugar fresco y seco"),
    (1103, "Guardar en un lugar fresco y seco"),
    (1104, "Guardar en un lugar fresco y seco"),
    (1105, "Guardar en un lugar fresco y seco"),
    (1106, "Guardar en un lugar fresco y seco"),
    (1107, "Guardar en lugar fresco, seco y alejado de la luz"),
    (1002, "Guardar en un lugar oscuro de la despensa"),
    (6005, "Guardar en una bolsa sellada en el cajón de frigorífico"),
    (1607, "Guardar en un lugar fresco y seco"),
    (1701, "Guardar en un lugar fresco y seco"),
    (4001, NULL);

-- Cuarto paso: Insertar los datos en la tabla elaborado
INSERT INTO elaborado (idProducto, PVP, IVA)
VALUES
    (1501,  1,   21),
    (1502,  2.5, 21);

-- Quinto paso: Insertar los datos en la tabla compra_producto
INSERT INTO compra_producto (idProducto, NIF, fecha, cantidad, precio, IVA, caducidad)
VALUES
    (2001, "B23373624", STR_TO_DATE("01/08/2021", "%d/%m/%Y"),  60,  3.24, 10, STR_TO_DATE("16/08/2021", "%d/%m/%Y")),
    (2001, "A50090349", STR_TO_DATE("10/08/2021", "%d/%m/%Y"),  25,  2.99, 10, STR_TO_DATE("20/08/2021", "%d/%m/%Y")),
    (1106, "A28647451", STR_TO_DATE("02/09/2021", "%d/%m/%Y"),   5,  8.75, 10, STR_TO_DATE("02/09/2023", "%d/%m/%Y")),
    (1105, "B90307034", STR_TO_DATE("17/09/2021", "%d/%m/%Y"),   2, 10.91, 10, STR_TO_DATE("14/04/2020", "%d/%m/%Y")),
    (1107, "B87867834", STR_TO_DATE("18/09/2021", "%d/%m/%Y"),   5,  6.50, 10, STR_TO_DATE("30/10/2019", "%d/%m/%Y")),
    (4001, "A28647451", STR_TO_DATE("07/09/2021", "%d/%m/%Y"), 480,  4.25, 10, NULL),
    (1607, "A28647451", STR_TO_DATE("07/09/2021", "%d/%m/%Y"), 700,  0.52, 10, NULL),
    (1501, "A28647451", STR_TO_DATE("07/09/2021", "%d/%m/%Y"), 100,  0.32, 10, NULL),
    (1502, "A58058868", STR_TO_DATE("05/09/2021", "%d/%m/%Y"), 100,  1.60, 10, NULL);


--------------------------------------------------------------------------------
-- 5. Realizar las siguientes consultas y anotar la sentencia SQL y su salida en
--  un documento:
-- A. Indicar el número de ingredientes registrados en la Base de Datos.
SELECT COUNT(*) AS numIngredientes FROM ingrediente;

-- B. Listar todos los productos ordenados por la categoría a la cual pertenecen.
SELECT producto.idProducto, producto.nombre, categoria.categoria
    FROM producto
    INNER JOIN categoria ON categoria.idCategoria=producto.idCategoria
    ORDER BY categoria.categoria ASC;

-- C. Mostrar en el listado la categoría, código, nombre y alerta_stock.
SELECT idCategoria, idProducto, nombre, alertaStock
    FROM producto
    ORDER BY idCategoria;

-- D. Hacer una relación de los proveedores de Verduras y Hortalizas.
SELECT * FROM proveedor AS p
	JOIN proveedor_categoria AS pc
    ON p.NIF=pc.NIFProveedor
    WHERE pc.idCategoria=6;

-- E. Listar las compras realizadas durante el mes en curso.
SELECT * FROM compra_producto
    WHERE MONTH(fecha) = MONTH(CURRENT_DATE);

-- F. Indicar el número de platos de ensalada registrados.
SELECT COUNT(idPlato) FROM plato
    WHERE idTipo = 3;

-- G. Mostrar aquellos proveedores cuyo nombre comience por la letra M.
SELECT *
    FROM proveedor
    WHERE empresa LIKE "M%";

-- H. Mostrar los productos que contengan alérgenos.
SELECT * FROM producto AS p
	JOIN alergeno_producto AS ap
	ON p.idProducto=ap.idProducto;

-- I. Reportar el total de compras en € realizadas a cada proveedor. La consulta
--  deberá tener los siguientes campos: Empresa, Número de productos y Total
--  Euros.
SELECT  proveedor.NIF,
        proveedor.empresa,
        COUNT(*) AS numProductos,
        SUM(cantidad) AS cantidadProductos,
        ROUND(SUM(precio*cantidad), 2) AS totalEuros
FROM compra_producto
    JOIN proveedor ON compra_producto.NIF=proveedor.NIF
    GROUP BY compra_producto.NIF
    -- Añadido el orden alfabético de empresas por mayor utilidad:
    ORDER BY proveedor.empresa;

-- J. Indicar aquellos productos que han cambiado de precio.
SELECT p.idProducto, p.nombre, p.precioCompra, c.precio
    FROM producto AS p
    INNER JOIN compra_producto AS c ON p.idProducto = c.idProducto
    WHERE p.precioCompra != c.precio;

-- K. Indicar la cantidad de platos ofertados por tipo de plato.
SELECT tipo_plato.*, COUNT(plato.idTipo) AS cantidad
    FROM tipo_plato
    JOIN plato ON plato.idTipo=tipo_plato.idTipo
    GROUP BY plato.idTipo;

-- L. Indicar cuántos platos registrados no se están ofertando en Menú.
SELECT COUNT(*) AS noEnMenu FROM plato
    WHERE enMenu=0;

-- M. Contar el total de donaciones por producto.
SELECT idProducto, COUNT(*)
    FROM detalle_donacion
    GROUP BY idProducto;

-- Con más información
SELECT 	producto.idProducto,
        producto.nombre,
        COUNT(*) AS numDonaciones,
        SUM(cantidad) AS cantidad
    FROM detalle_donacion
    JOIN producto
    ON detalle_donacion.idProducto=producto.idProducto
    GROUP BY idProducto;


-- N. Formular una consulta que tenga una agrupación con Group By.
SELECT plato.idPlato
  FROM plato
  GROUP BY idTipo;

-- O. Formular una consulta que tenga una agrupación con Group By y un filtraje
--  con Having.
SELECT idCategoria, SUM(precioCompra) AS totalCompras
    FROM producto
    GROUP BY idCategoria
    HAVING  totalCompras > 20;

--------------------------------------------------------------------------------
-- 6. Realizar las siguientes modificaciones en los datos insertados y anotar la
--  sentencia SQL y su salida en un documento:
-- A. Actualizar el campo Porcentaje_Merma con la división de la Cantidad_Neta
--  entre la Cantidad_Bruta en la tabla INGREDIENTES_PLATO.
UPDATE ingrediente_plato
    SET porcentajeMerma=cantNeta/cantBruta;

-- B. Cambiar la fecha de caducidad de los productos, sumándole 7 días.
UPDATE compra_producto
    SET caducidad = DATE_ADD(caducidad, INTERVAL 7 DAY);

-- C. Actualizar el PVP de los platos, aumentando en un 2%.
UPDATE plato SET PVP = ROUND(PVP / 1.02, 2);

-- D. Eliminar aquellas CATEGORÍAS que no tengan PROVEEDORES.
-- Primera versión. Provoca errores de integridad.
DELETE FROM categoria WHERE idCategoria NOT IN
	(SELECT idCategoria FROM proveedor_categoria);

-- Segunda versión. También problemática.
DELETE FROM categoria
    WHERE idCategoria NOT IN
    (SELECT idCategoria FROM proveedor_categoria)
    AND idCategoria NOT IN
    (SELECT idCategoria FROM producto);

-- Propuesta útil. Saber (sin borrar) las categorías sin proveedor
SELECT * FROM categoria
    WHERE idCategoria NOT IN
    (SELECT idCategoria FROM proveedor_categoria);

-- Todavía más útil. Saber (sin borrar) las categorías de productos sin proveedor
SELECT * FROM categoria
    WHERE idCategoria NOT IN
    (SELECT idCategoria FROM proveedor_categoria)
    AND idCategoria IN
    (SELECT idCategoria FROM producto);


-- E. Borrar los productos elaborados que nunca se hayan vendido. Para ello
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


