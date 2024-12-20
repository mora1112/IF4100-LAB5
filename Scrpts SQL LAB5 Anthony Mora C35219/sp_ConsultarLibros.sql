USE [LABORATORIO5]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarLibros]
    @IdLibro INT = NULL,
    @Titulo VARCHAR(50) = NULL,
    @ISBN VARCHAR(15) = NULL,
    @Paginas INT = NULL,
    @Editorial VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM BIBLIOTECA.LIBRO
    WHERE
        (@IdLibro IS NULL OR CODIGO_LIBRO = @IdLibro) AND
        (@Titulo IS NULL OR TITULO LIKE '%' + @Titulo + '%') AND
        (@ISBN IS NULL OR ISBN = @ISBN) AND
        (@Paginas IS NULL OR PAGINAS = @Paginas) AND
        (@Editorial IS NULL OR EDITORIAL LIKE '%' + @Editorial + '%')
END
