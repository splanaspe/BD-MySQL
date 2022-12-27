-- 4c : Hacer una lista del coste de cada plato versus su PVP
-- tomado en cuenta el coste de sus ingredientes.
-- Ordenar el listado por el beneficio aportado.

SELECT
	ip.idPlato,
    pl.nombre,
	SUM(pr.precioCompra * ip.cantBruta * IF(ip.unidad='ud', 1, 0.001)) costeIngredientes,
    pl.PVP,
    100 * pl.PVP / (100 + pl.IVA) precioSinIVA,
    (100 * pl.PVP / (100 + pl.IVA)) - (SUM(pr.precioCompra * ip.cantBruta * IF(ip.unidad='ud', 1, 0.001))) beneficioNeto
FROM producto pr
JOIN ingrediente_plato ip ON pr.idProducto = ip.idProducto
JOIN plato pl ON ip.idPlato=pl.idPlato
GROUP BY ip.idPlato
ORDER BY beneficioNeto DESC;
