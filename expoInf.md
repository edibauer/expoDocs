### Create tables
```sql
CREATE TABLE schema_name.table_name(
    column DATATYPE,
    columns DATATYPE,
    column DATATYPE,

    PRIMARY KEY (column, column)
)
```

### Create Functions
```sql
CREATE FUNCTION schema_name.function_name (params1 DATATYPE, params2 DATATYPE) -- parameters
RETURNS variable_name DATATYPE
LANGUAGE SQLSCRIPT
AS
BEGIN

    -- Variables
    DECLARE some_var DATE;

    -- Script
    SELECT...
END
```
### Create Stored Procedures
```sql
CREATE PROCEDURE schema_name.stored_procedure_name (params1 DATAYTPE, params2 DATATYPE)
LANGUAGE SQLSCRIPT
SQL SECURITY INVOKER
DEFAULT SCHEMA EXT
AS
BEGIN
    
    -- Variables
    DECLARE some_var DATE;

    -- Script
    SELECT...

END
```
### Create Trigger

### Create Views

### CDL
- Es una pieza de información
