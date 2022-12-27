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
