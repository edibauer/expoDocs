+ Stored Procedures:

Procedimiento para aumentar salarios por departamento
Procedimiento para registrar nuevos empleados
Incluye manejo de transacciones y errores
Usa parámetros IN y OUT

```sql
-- Stored Procedure para aumentar salarios por departamento
DELIMITER //
CREATE PROCEDURE sp_aumentar_salarios_departamento(
    IN p_departamento VARCHAR(50),
    IN p_porcentaje_aumento DECIMAL(5,2),
    OUT p_empleados_actualizados INT
)
BEGIN
    DECLARE exit_handler BOOLEAN DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET exit_handler = TRUE;
    
    START TRANSACTION;
    
    UPDATE empleados 
    SET salario = salario * (1 + (p_porcentaje_aumento / 100))
    WHERE departamento = p_departamento
    AND activo = true;
    
    SET p_empleados_actualizados = ROW_COUNT();
    
    IF exit_handler THEN
        ROLLBACK;
        SET p_empleados_actualizados = 0;
    ELSE
        COMMIT;
    END IF;
    
END //
DELIMITER ;

-- Stored Procedure para registrar un nuevo empleado
DELIMITER //
CREATE PROCEDURE sp_registrar_empleado(
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_departamento VARCHAR(50),
    IN p_salario DECIMAL(10,2)
)
BEGIN
    INSERT INTO empleados (
        nombre, 
        apellido, 
        email, 
        departamento, 
        salario, 
        fecha_contratacion
    ) VALUES (
        p_nombre,
        p_apellido,
        p_email,
        p_departamento,
        p_salario,
        CURDATE()
    );
END //
DELIMITER ;
```