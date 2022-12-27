-- L. Indicar cuántos platos registrados no se están ofertando en Menú.
SELECT COUNT(*) AS noEnMenu FROM plato
    WHERE enMenu=0;
