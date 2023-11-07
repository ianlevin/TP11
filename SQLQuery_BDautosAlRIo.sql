CREATE PROCEDURE sp_ObtenerAutos
AS
BEGIN
	SELECT * FROM Auto
END

exec sp_ObtenerAutos