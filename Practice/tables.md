+ Creación de tabla:

Una tabla de empleados con varios campos útiles
Uso de diferentes tipos de datos
Claves primarias y restricciones


+ Operaciones de inserción (Create):

Inserción múltiple
Inserción individual
Manejo de diferentes tipos de datos


+ Operaciones de lectura (Read):

Consultas básicas
Consultas con filtros


+ Operaciones de actualización (Update):

Actualización individual
Actualización múltiple
Actualización condicional


+ Operaciones de borrado (Delete):

Borrado físico
Borrado suave (soft delete)
Borrado condicional

+ Code example
```sql
CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    departamento VARCHAR(50),
    salario DECIMAL(10,2),
    fecha_contratacion DATE,
    activo BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insertar datos (CREATE)
INSERT INTO empleados (nombre, apellido, email, departamento, salario, fecha_contratacion) 
VALUES 
    ('Juan', 'Pérez', 'juan.perez@empresa.com', 'Ventas', 35000.00, '2023-01-15'),
    ('María', 'García', 'maria.garcia@empresa.com', 'Recursos Humanos', 42000.00, '2023-02-01'),
    ('Carlos', 'López', 'carlos.lopez@empresa.com', 'TI', 48000.00, '2023-03-10');

-- Insertar un solo registro
INSERT INTO empleados (nombre, apellido, email, departamento, salario, fecha_contratacion)
VALUES ('Ana', 'Martínez', 'ana.martinez@empresa.com', 'Marketing', 38000.00, '2023-04-20');

-- Leer datos (READ)
-- Seleccionar todos los empleados
SELECT * FROM empleados;

-- Seleccionar empleados con filtros
SELECT nombre, apellido, departamento, salario 
FROM empleados 
WHERE departamento = 'Ventas' 
AND salario > 30000.00;

-- Actualizar datos (UPDATE)
-- Actualizar salario de un empleado específico
UPDATE empleados 
SET salario = 38000.00,
    departamento = 'Ventas Senior' 
WHERE id_empleado = 1;

-- Actualizar múltiples registros
UPDATE empleados 
SET salario = salario * 1.10 
WHERE departamento = 'Ventas';

-- Borrar datos (DELETE)
-- Borrar un empleado específico
DELETE FROM empleados 
WHERE id_empleado = 4;

-- Borrar múltiples registros
DELETE FROM empleados 
WHERE departamento = 'Marketing' 
AND fecha_contratacion < '2023-01-01';

-- Borrado suave (soft delete)
UPDATE empleados 
SET activo = false 
WHERE id_empleado = 2;

-- Consulta que solo muestra empleados activos
SELECT * FROM empleados WHERE activo = true;
```
