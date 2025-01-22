+ Función (FUNCTION):

Calcula bonos anuales
Usa lógica condicional
Maneja diferentes casos según años de servicio

+ script
```sql
-- Función para calcular el bono anual basado en años de servicio y salario
DELIMITER //
CREATE FUNCTION calcular_bono_anual(
    p_años_servicio INT,
    p_salario DECIMAL(10,2)
) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE bono DECIMAL(10,2);
    
    SET bono = CASE
        WHEN p_años_servicio < 2 THEN p_salario * 0.05
        WHEN p_años_servicio < 5 THEN p_salario * 0.10
        WHEN p_años_servicio < 10 THEN p_salario * 0.15
        ELSE p_salario * 0.20
    END;
    
    RETURN bono;
END //
DELIMITER ;
```