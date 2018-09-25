create or replace PROCEDURE LoginUsuario
(
    --VARIABLES DE ENTRADA--
    L_nick USUARIO.NICK_USER%TYPE,
    L_pass USUARIO.PASSWORD_USER%TYPE,
    
    --VARIABLES DE SALIDA--
    L_aux OUT INTEGER,
    L_doc OUT USUARIO.DOC_USER%TYPE,
    L_nombre OUT USUARIO.NOMBRE_USER%TYPE,
    L_apellidos OUT USUARIO.APELLIDOS_USER%TYPE,
    L_correo OUT USUARIO.CORREO_USER%TYPE,
    L_celular OUT USUARIO.CELULAR_USER%TYPE,
    L_PerfilUsuario OUT USUARIO.ID_PERFIL_USER%TYPE,
    L_Estado OUT USUARIO.ESTADO_USER%TYPE
    
) AS

BEGIN
        SELECT count(*) as Contador, 
              DOC_USER,
              NOMBRE_USER, 
              APELLIDOS_USER, 
              CELULAR_USER, 
              CORREO_USER, 
              ID_PERFIL_USER, 
              ESTADO_USER
        INTO 
        L_aux, 
        L_doc, 
        L_nombre, 
        L_apellidos, 
        L_correo, 
        L_celular, 
        L_PerfilUsuario, 
        L_Estado
        FROM USUARIO
        WHERE NICK_USER = L_nick AND PASSWORD_USER = L_pass
        GROUP BY 
              DOC_USER,
              NOMBRE_USER, 
              APELLIDOS_USER, 
              CELULAR_USER, 
              CORREO_USER, 
              ID_PERFIL_USER, 
              ESTADO_USER
        ORDER BY DOC_USER;


    EXCEPTION WHEN NO_DATA_FOUND THEN
    L_aux := 0;
END;