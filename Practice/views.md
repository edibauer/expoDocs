+ Vista (VIEW):

Muestra información resumida de empleados
Calcula años de antigüedad
Concatena nombres

+ script
```sql
-- Crear una vista que muestra información resumida de empleados
CREATE VIEW vista_empleados_resumen AS
SELECT 
    e.id_empleado,
    CONCAT(e.nombre, ' ', e.apellido) as nombre_completo,
    e.departamento,
    e.salario,
    e.fecha_contratacion,
    YEAR(CURDATE()) - YEAR(e.fecha_contratacion) as años_antiguedad
FROM empleados e
WHERE e.activo = true;
```