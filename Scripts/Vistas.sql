-- Creación de Vista de Logs de Auditoria
CREATE OR REPLACE VIEW v_Logs AS
    SELECT USUARIO.NOMBRE_USER, TIPO_PERFIL.NOMBRE_TIPO_PERFIL, ACCION_LOGS, DESCRIPCION_LOGS, FECHA_LOGS 
    FROM LOGS
    INNER JOIN USUARIO ON LOGS.ID_USER_LOGS = USUARIO.DOC_USER
    INNER JOIN TIPO_PERFIL ON USUARIO.ID_PERFIL_USER = TIPO_PERFIL.ID_TIPO_PERFIL;

-- Creación de Vista para mostrar las Facultades con la Información del Decano     
CREATE OR REPLACE VIEW v_Facultad AS
    SELECT FACULTAD.ID_FACULTAD, FACULTAD.CODIGO_FACULTAD, FACULTAD.NOMBRE_FACULTAD, FACULTAD.DECANO_FACULTAD, USUARIO.NOMBRE_USER, USUARIO.APELLIDOS_USER, USUARIO.CORREO_USER, USUARIO.CELULAR_USER
    FROM FACULTAD
    INNER JOIN USUARIO ON FACULTAD.DECANO_FACULTAD = USUARIO.DOC_USER;

-- Creación de vista para mostrar los Decanos Asignados a x Facultad
CREATE OR REPLACE VIEW v_Decanos AS
    SELECT USUARIO.DOC_USER, USUARIO.NOMBRE_USER, USUARIO.APELLIDOS_USER, TIPO_PERFIL.NOMBRE_TIPO_PERFIL
    FROM USUARIO
    INNER JOIN TIPO_PERFIL ON USUARIO.ID_PERFIL_USER = TIPO_PERFIL.ID_TIPO_PERFIL
    LEFT JOIN FACULTAD ON USUARIO.DOC_USER = FACULTAD.DECANO_FACULTAD
    WHERE NOMBRE_TIPO_PERFIL LIKE 'Decano%' AND FACULTAD.ID_FACULTAD IS NULL;