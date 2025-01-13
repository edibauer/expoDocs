### 1 Introducción
### 2 Flujo de Información
### 3 Preparación del Sistema
### 4 Esquemas
### 5 Tablas Básicas
### 6 Bases de Datos
#### TABLAS

### Create tables
```sql
CREATE TABLE schema_name.table_name(
    column DATATYPE,
    columns DATATYPE,
    column DATATYPE,

    PRIMARY KEY (column, column)
)
```
#### FUNCIONES
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
#### STORED PROCEDURES
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
#### TRIGGER
### Create Trigger
```sql
CREATE TRIGGER "EXT"."TG_SUCME_AI" 
AFTER INSERT ON "EXT"."TB_EMPLEADO_TEST" 
REFERENCING NEW ROW MYNEWROW 
FOR EACH ROW 
BEGIN      

	-- Variables
	DECLARE id_tipo_mesa INT;
	DECLARE id_mesa INT;
	
	-- Script
END
```

#### VIEWS
### Create Views
```sql
CREATE VIEW "EXT"."CSA_ASISTENCIA_ITX" ( "ID_SUCURSAL", "ID_EMPLEADO", "FECHA_ASISTENCIA", "ASISTENCIA_ITX" ) 
AS (SELECT ID_SUCURSAL, ID_EMPLEADO, FECHA_ASISTENCIA, ASISTENCIA_ITX
	FROM EXT.TB_ASISTENCIA_WKF
	WHERE FECHA_ASISTENCIA = '2024-07-24'
	AND ID_SUCURSAL = 661
) WITH  STRUCTURED PRIVILEGE CHECK
```
### 7 CDL
+ Definición

CDL (Comissions Data Loader) es un componente fundamental de Commissions que permite la transferencia segura y eficiente de datos estructurados. Facilita la integración de Commissions con otros sistemas, permitiendo la importación y exportación de datos de objetos de negocio específicos. CDL es ideal para sincronizar grandes volúmenes de información en un entorno empresarial.

+ Tipos de Esquema
    - TCMP: El esquema base constituye el repositorio central de todos los datos indispensables para el cálculo preciso de incentivos. Contiene información detallada sobre transacciones, reglas de negocio, jerarquías organizacionales, cuotas, tablas de referencia y demás elementos relevantes. Dada su naturaleza fundamental, este esquema se configura con permisos de solo lectura para los usuarios, asegurando así la integridad y consistencia de los cálculos."

    - EXT: Mientras que el esquema TCMP actúa como un repositorio de datos inmutable, este esquema se configura como un entorno de desarrollo dinámico. Los desarrolladores disponen de los permisos necesarios para crear, modificar y eliminar objetos de base de datos, adaptando la estructura a las necesidades evolutivas de los cálculos de incentivos.

+ Commissions Data Loader

CDL permite la importación y exportación de datos estructurados correspondientes a los objetos de negocio definidos en Commissions. La herramienta facilita la transferencia masiva de datos entre Commissions y sistemas externos, empleando formatos de archivo plano con codificación UTF-8 como estándar. 

Los datos se organizan en los siguientes espacios de trabajo: Orders and Transactions (Resultados), Participants, Positions, and Titles (Organización), y Categories, Products, Customers, and Postal Codes (Clasificación). 

Una operación de importación (Inbound) consiste en cargar datos desde un sistema externo hacia Commissions, mientras que una exportación (Outbound) implica extraer datos de Commissions hacia un sistema externo.

+ Archivos CDL

Para garantizar la estandarización y agilizar el proceso de carga de datos, se proporcionan plantillas en formato .xls comprimidas en un archivo .zip. Estas plantillas, diseñadas para cada objeto de negocio, ofrecen un esquema predefinido que simplifica la creación de archivos de carga y reduce el riesgo de errores.
[imagen CDL]

+ EXT como personalización

En ocasiones, la estructura predefinida de un CDL estándar puede resultar insuficiente para satisfacer los requisitos específicos de un proceso de importación o transferencia de datos. En estos casos, es posible definir CDLs personalizados que se ajusten a las necesidades particulares del usuario. Estas personalizaciones se implementan en el esquema EXT.

### 8 Archivos CDL
+ Express Data Loader (XDL)

XDL es una herramienta de carga y descarga de datos basada en la nube que ofrece una interfaz intuitiva para la integración de datos. Permite al equipo de compensaciones realizar operaciones de ETL (Extracción, Transformación y Carga) de manera eficiente, sin requerir conocimientos avanzados de programación. [img XDL]
![alt text](image-1.png)

+ File Type Setup

Abarca tanto los formatos de entrada como de salida de datos.

    - Inbound: La configuración incluye la definición de un esquema detallado, el cual especifica los metadatos y la estructura de cada registro. Es mandatorio asignar un File Type único a cada plantilla, estableciendo así una relación uno a uno. Los parámetros configurables comprenden el formato de archivo, las opciones de importación y la tabla de destino. Asimismo, es posible personalizar el conjunto de caracteres y el delimitador utilizados en la separación de los campos.

    - Outbound: La configuración define la estructura y los metadatos de los archivos generados, incluyendo aquellos que contienen datos de pago. Esta configuración abarca aspectos como el formato de salida, el procedimiento almacenado que suministra los datos y las opciones de compresión. Al igual que en la configuración de entrada, se permite personalizar el conjunto de caracteres y el delimitador utilizados para separar los campos.

![alt text](image.png)

+ Configuración del File Type Setup 
1. Inicio de Sesión
2. Click en los cuadritos para abrir el XDL (Express Data Loader)
3. Click en el ícono de la herramienta para abrir el File Type Setup
4. Click en (+)
![alt text](image-2.png)
5. Colocar los parámetros requeridos
![alt text](image-3.png)
[View XDL pdf to ref]

+ Carga de CDL's desde SFTP
1. Establecer la conexión vía SFTP
2. Armar el CDL de acuerdo al File Type SetUp
3. Arrastar al archivo hacia INBOUND
4. Validar la carga desde XDL
5. Validar la carga en la BD

### 9 Query For Value
+ Definición

La integración de funciones de consulta en los procesos de canalización permite una mayor flexibilidad en la extracción y manipulación de datos. Estas funciones facilitan la ejecución de consultas SQL en tiempo real, cuyos resultados pueden ser utilizados por el equipo de servicios profesionales para crear soluciones personalizadas que complementen las capacidades estándar del producto.

```
Formula: Query for String (<query name>, <string parameter>, <string parameter>, <value parameter>, <value parameter>, <value parameter>, <boolean parameter>, <boolean parameter>, <date parameter>, <date parameter>, <default value>)
```

+ Variables como contexto

    - $pipelineRunSeq - current pipeline run's pipelineRunSeq
    - $periodSeq - current pipeline run's periodSeq
    - $positionSeq - current position in the processing

+ Variables como parámetros

    - $1 - value of the first String parameter in the Query function. (first String parameter)
    - $2 - value of the second String parameter in the Query function (second String parameter)
    - $3 - value of the first Value parameter in the Query function (first Value parameter)
    - $4 - value of the second Value parameter in the Query function (second Value parameter)
    - $5 - value of the first Boolean parameter in the Query function (first Boolean parameter)
    - $6 - value of the second Boolean parameter in the Query function (second Boolean parameter)
    - $7 - value of the first Date parameter in the Query function (first Date parameter)
    - $8 - value of the second Date parameter in the Query function (second Date parameter)

+ Formula o función General
![alt text](image-4.png)

+ Reestricciones Generales
    - Sólo se permite la función SELECT SQL, cualquier otro tipo de SQL como INSERT, UPDATE, DELETE fallará.
    - La consulta tiene que terminar antes de 5 segundos, o se cancelará. (La consulta finalizará y el pipeline continuará).
    - Si la consulta devuelve varias filas, sólo se devolverá el valor de la primera fila.

+ Tipos de Queries
    - Query for Value
    - Query for String
    - Query for Boolean
    - Query for Date

+ Creación y colocación de parámetros
```sql
INSERT INTO "TCMP"."CS_PLUGINQUERY" VALUES(
	''/*TENANTID <VARCHAR(4)>*/,
	''/*NAME <VARCHAR(255)>*/,
	''/*QUERY <CLOB>*/,
	''/*DESCRIPTION <VARCHAR(4000)>*/
)
```

+ Llamada desde webiDE
1. Colocar el query con los parámetros 

### 10 Data Extract
+ Definición

La funcionalidad de extracción de datos, accesible desde la opción 'Run > Pipeline', permite exportar diversos tipos de archivos durante la ejecución de una cálculo. Esta característica, disponible en entornos que emplean Express Data Loader y bases de datos HANA, facilita la extracción de datos estructurados de acuerdo a las especificaciones predefinidas por el usuario. Los archivos resultantes son almacenados en la ruta de salida configurada previamente (outbound).

![alt text](image-5.png)

+ Declaración del File Type

+ Declaración y creación de tablas y script

+ Proceso de extracción

+ Verifiación de Salida SFTP
El archivo de extracción se debe depositar en la carpeta OUTBOUND del SFTP


