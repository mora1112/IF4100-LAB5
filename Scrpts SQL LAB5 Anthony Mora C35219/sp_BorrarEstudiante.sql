USE [LABORATORIO5]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_BorrarEstudiante]
    @CodigoUsuario INT
AS
BEGIN
    BEGIN TRY
        -- Verifica si el estudiante existe
        IF EXISTS (SELECT 1 FROM BIBLIOTECA.USUARIO WHERE CODIGO_USUARIO = @CodigoUsuario)
        BEGIN

            -- Primero elimina los préstamos asociados al usuario
            DELETE FROM BIBLIOTECA.PRESTAMOS
            WHERE CODIGO_USUARIO = @CodigoUsuario;

            -- Luego elimina el usuario
            DELETE FROM BIBLIOTECA.USUARIO
            WHERE CODIGO_USUARIO = @CodigoUsuario;

            PRINT N'El estudiante y sus préstamos asociados han sido eliminados exitosamente';
        END
        ELSE
        BEGIN
            PRINT N'EL ESTUDIANTE NO EXISTE EN LA BASE DE DATOS';
            SELECT 'EL ESTUDIANTE NO EXISTE EN LA BASE DE DATOS' AS Mensaje;
        END
    END TRY
    BEGIN CATCH
        PRINT 'Error al eliminar el estudiante y sus préstamos';
        THROW;
    END CATCH
END
