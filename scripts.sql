-- Query For VALUE
INSERT INTO "TCMP"."CS_PLUGINQUERY" VALUES(
	''/*TENANTID <VARCHAR(4)>*/,
	''/*NAME <VARCHAR(255)>*/,
	''/*QUERY <CLOB>*/,
	''/*DESCRIPTION <VARCHAR(4000)>*/
)

-- TABLES
CREATE TABLE SCHEMA.TABLE_NAME(
    column DATATYPE,
    columns DATATYPE,
    column DATATYPE,

    PRIMARY KEY (column, column)
)

-- INSERT
INSERT INTO SCHEMA.TABLE_NAME VALUES(
	/*ID_SUCURSAL <INTEGER>*/,
	''/*ID_EMPLEADO <VARCHAR(40)>*/,
	''/*ID_CVE_EMPRESA <VARCHAR(6)>*/,
	/*ID_TIPO_MESA <INTEGER>*/,
	/*ID_MESA <INTEGER>*/,
	''/*ID_CARGO <VARCHAR(6)>*/,
	''/*DESCRIPCION <VARCHAR(127)>*/,
	''/*FECHA_CREACION <DATE>*/,
	''/*FECHA_MODIFICACION <DATE>*/,
	/*ESTATUS <BOOLEAN>*/,
	''/*USUARIO_CREACION <VARCHAR(255)>*/,
	''/*USUARIO_MODIFICACION <VARCHAR(255)>*/
)

-- UPDATE
UPDATE SCHEMA.TABLE_NAME
SET COLUMN = VALUE
WHERE COLUMN = '' -- COLUMN_NAME AND VALUE
AND COLUMN = -- COLUMN_NAME AND VALUE

-- ALTER
ALTER TABLE SCHEMA.TABLE_NAME
ALTER (COLUMN VARCHAR(127)) -- COLUMN_NAME AND DATATYPE

-- DELETE
DELETE FROM SCHEMA.TABLE_NAME
WHERE COLUMN_NAME = VALUE

-- DROP
DROP TABLE SCHEMA.TABLE_NAME

-- CREATE
CREATE FUNCTION SCHEMA.FUNCTION_NAME (params1 DATATYPE, params2 DATATYPE) -- parameters
RETURNS variable_name DATATYPE
LANGUAGE SQLSCRIPT
AS
BEGIN

    -- Variables
    DECLARE some_var DATE;

    -- Script
    SELECT...
	INTO some_var
	WHERE COLUMN = :params1
END

-- PARAMS
CREATE FUNCTION SCHEMA.FUNCTION_NAME (params1 DATATYPE, params2 DATATYPE) -- parameters

-- CALL
SELECT SCHEMA.FUNCTION_NAME (PARAM1, PARAM2) FROM DUMMY

-- CREATE
CREATE PROCEDURE SCHEMA.PROCEDURE_NAME (params1 DATAYTPE, params2 DATATYPE)
LANGUAGE SQLSCRIPT
SQL SECURITY INVOKER
DEFAULT SCHEMA EXT
AS
BEGIN
    
    -- Variables
    DECLARE some_var DATE;

    -- Script
    SELECT...
	INTO some_var
    WHERE COLUMN = :params1

END

-- PARAMS
CREATE PROCEDURE SCHEMA.PROCEDURE_NAME (params1 DATAYTPE, params2 DATATYPE) -- PARAMETERS

-- CALL
CALL SCHEMA.PROCEDURE_NAME() -- PARAMS IF EXISTS

-- CREATE  
AFTER INSERT ON SCHEMA.TABLE_NAME
REFERENCING NEW ROW MYNEWROW 
FOR EACH ROW 
BEGIN      

	-- Variables
	DECLARE VARIABLE INT;
	DECLARE VARIABLE INT;
	
	-- Script
END

-- CREATE
CREATE VIEW SCHEMA.VIEW_NAME ( COLUMN1, COLUMN2, COLUMN3 ) 
AS (SELECT COLUMN1, COLUMN2, COLUMN3
	FROM SCHEMA.TABLE_NAME
	WHERE COLUMN = DATA -- Some value
) WITH  STRUCTURED PRIVILEGE CHECK

-- Variables
-- $pipelineRunSeq - current pipeline run's pipelineRunSeq
-- $periodSeq - current pipeline run's periodSeq
-- $positionSeq - current position in the processing

-- Variables
-- $1 - value of the first String parameter in the Query function. (first String parameter)
-- $2 - value of the second String parameter in the Query function (second String parameter)
-- $3 - value of the first Value parameter in the Query function (first Value parameter)
-- $4 - value of the second Value parameter in the Query function (second Value parameter)
-- $5 - value of the first Boolean parameter in the Query function (first Boolean parameter)
-- $6 - value of the second Boolean parameter in the Query function (second Boolean parameter)
-- $7 - value of the first Date parameter in the Query function (first Date parameter)
--$8 - value of the second Date parameter in the Query function (second Date parameter)