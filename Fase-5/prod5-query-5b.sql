--5B. Crear un disparador que, al realizar la compra de un producto,
--copie su código, tipo (ingrediente o elaborado), cantidad y unidad
--en una nueva tabla (esta tabla deberá ser creada por vosotros).

-- Crear la nueva tabla de registro de compras
CREATE TABLE reg_compra (
    idRegCompra INT NOT NULL AUTO_INCREMENT,
    idProducto INT NOT NULL,
    tipo ENUM('ingrediente', 'elaborado') NOT NULL,
    cantidad INT NOT NULL,
    unidad ENUM('Kilogramos','Litros','Unidades') NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (idProducto) REFERENCES producto(idProducto)
);

-- En nuestra BD no tenemos un campo `tipo` para distinguir los productos.
-- Será necesario comprobar si el producto existe en 'elaborados' o 'ingredientes'

CREATE TRIGGER comprueba_reg_compra_insert
AFTER INSERT ON compra_producto
FOR EACH ROW
INSERT INTO reg_compra (idProducto, tipo, cantidad, unidad)
	VALUES
    (NEW.idProducto, -- idProducto
    IF(NEW.idProducto IN
        (SELECT idProducto FROM elaborado), 'elaborado', 'ingrediente'), -- tipo
    NEW.cantidad, -- cantidad
    (SELECT unidad FROM producto AS pr WHERE pr.idProducto=NEW.idProducto) -- unidad
    );
