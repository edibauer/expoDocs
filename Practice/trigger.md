+ Triggers:

Trigger de auditoría para cambios en salarios
Trigger de validación para salario mínimo
Incluye tabla de log para auditoría

```sql
-- Trigger para auditar cambios en salarios
CREATE TABLE log_cambios_salario (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT,
    salario_anterior DECIMAL(10,2),
    salario_nuevo DECIMAL(10,2),
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR(50)
);

DELIMITER //
CREATE TRIGGER trg_auditoria_salario
AFTER UPDATE ON empleados
FOR EACH ROW
BEGIN
    IF OLD.salario != NEW.salario THEN
        INSERT INTO log_cambios_salario (
            id_empleado,
            salario_anterior,
            salario_nuevo,
            usuario
        ) VALUES (
            NEW.id_empleado,
            OLD.salario,
            NEW.salario,
            CURRENT_USER()
        );
    END IF;
END //
DELIMITER ;

-- Trigger para validar salario mínimo antes de insertar o actualizar
DELIMITER //
CREATE TRIGGER trg_validar_salario_minimo
BEFORE INSERT ON empleados
FOR EACH ROW
BEGIN
    DECLARE salario_minimo DECIMAL(10,2);
    SET salario_minimo = 30000.00;
    
    IF NEW.salario < salario_minimo THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El salario no puede ser menor al mínimo establecido';
    END IF;
END //
DELIMITER ;
```