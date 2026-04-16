-- 1. SELECT *: Ver todos los productos registrados
SELECT * FROM Productos;

-- 2. WHERE: Buscar ventas realizadas en una ciudad específica (Managua)
SELECT V.VentaID, C.Nombre, C.Ciudad, V.FechaVenta
FROM Ventas V
JOIN Clientes C ON V.ClienteID = C.ClienteID
WHERE C.Ciudad = 'Managua';

-- 3. LIKE: Buscar productos que pertenezcan a categorías de 'Audio' o similares
SELECT * FROM Productos 
WHERE Categoria LIKE '%Audio%';

-- 4. JOIN: Mostrar detalle de ventas con nombres de cliente y producto
SELECT V.VentaID, C.Nombre AS Cliente, P.NombreProducto, V.Cantidad, V.FechaVenta
FROM Ventas V
INNER JOIN Clientes C ON V.ClienteID = C.ClienteID
INNER JOIN Productos P ON V.ProductoID = P.ProductoID;

-- 5. GROUP BY & Funciones Agregadas: Total de ingresos generados por cada producto
SELECT P.NombreProducto, SUM(V.Cantidad * P.Precio) AS IngresosTotales
FROM Ventas V
JOIN Productos P ON V.ProductoID = P.ProductoID
GROUP BY P.NombreProducto;

-- 6. ORDER BY: Mostrar los productos más caros primero
SELECT NombreProducto, Precio 
FROM Productos 
ORDER BY Precio DESC;