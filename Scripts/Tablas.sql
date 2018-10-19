CREATE TABLE USUARIO
(
    DOC_USER VARCHAR2(15),
    NICK_USER VARCHAR2(20),
    PASSWORD_USER VARCHAR2(20),
    NOMBRE_USER VARCHAR2(40),
    APELLIDOS_USER VARCHAR2(40),
    CELULAR_USER VARCHAR2(15),
    CORREO_USER VARCHAR2(30),
    ID_PERFIL_USER INTEGER,
    ESTADO_USER INTEGER
)
TABLESPACE POLINOTES;

CREATE TABLE TIPO_PERFIL
(
    ID_TIPO_PERFIL INTEGER,
    NOMBRE_TIPO_PERFIL VARCHAR2(10)
)
TABLESPACE POLINOTES;

CREATE TABLE ESTADO
(
    ID_ESTADO INTEGER,
    NOMBRE_ESTADO VARCHAR2(10)
)
TABLESPACE POLINOTES;

CREATE TABLE LOGS 
(
   ID_LOGS INTEGER,
   ID_USER_LOGS INTEGER,
   ACCION_LOGS VARCHAR2(30),
   DESCRIPCION_LOGS VARCHAR2(255),
   FECHA_LOGS VARCHAR2(50)  
)
TABLESPACE POLINOTES;

