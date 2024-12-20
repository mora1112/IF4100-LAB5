USE [LABORATORIO5]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ActualizarAutor]
    -- Parámetros para actualizar los datos de un autor
    @CodigoAutor INT,
    @NuevoNombre VARCHAR(30)
AS
BEGIN
    -- Verifica si el autor existe
    IF EXISTS (SELECT 1 FROM BIBLIOTECA.AUTOR WHERE CODIGO = @CodigoAutor)
    BEGIN
        UPDATE BIBLIOTECA.AUTOR
        SET NOMBRE = @NuevoNombre
        WHERE CODIGO = @CodigoAutor
    END
    ELSE
    BEGIN
        PRINT N'EL AUTOR NO EXISTE'
        SELECT 'EL AUTOR NO EXISTE' AS Mensaje
    END
END
