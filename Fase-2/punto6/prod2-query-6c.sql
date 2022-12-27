-- C. Actualizar el PVP de los platos, aumentando en un 2%.
UPDATE plato SET PVP = ROUND(PVP / 1.02, 2);
