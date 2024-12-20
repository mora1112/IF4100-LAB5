USE [LABORATORIO5]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarPrestamo]
    -- Parámetros para el procedimiento almacenado
    @CodigoUsuario INT,
    @CodigoEjemplar INT,
    @FechaPrestamo DATETIME,
    @FechaDevolucion DATE
AS
BEGIN
    -- Verifica si el ejemplar ya está prestado
    IF NOT EXISTS (
        SELECT 1 
        FROM LABORATORIO5.BIBLIOTECA.PRESTAMOS
        WHERE CODIGO_EJEMPLAR = @CodigoEjemplar 
          AND FECHA_DEVOLUCION IS NULL
    )
    BEGIN
        -- Inserta el nuevo préstamo
        INSERT INTO LABORATORIO5.BIBLIOTECA.PRESTAMOS
        (
            CODIGO_USUARIO,
            CODIGO_EJEMPLAR,
            FECHA_PRESTAMO,
            FECHA_DEVOLUCION
        )
        VALUES
        (
            @CodigoUsuario,
            @CodigoEjemplar,
            @FechaPrestamo,
            @FechaDevolucion
        )
    END
    ELSE
    BEGIN
        PRINT N'EL EJEMPLAR YA ESTÁ PRESTADO'
        SELECT 'EL EJEMPLAR YA ESTÁ PRESTADO' AS Mensaje
    END
END
