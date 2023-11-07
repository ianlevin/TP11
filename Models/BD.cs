using System.Data.SqlClient;
using Dapper;

public static class BD{
    private static string ConnectionString {get; set;} = @"Server=localhost;DataBase=BD_TP11;Trusted_Connection=True;";

    /*Listas*/
    public static List<Auto> ObtenerAutos(){
        List<Auto> user = new List<Auto>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "exec sp_ObtenerAutos";
            user = db.Query<Auto>(sql).ToList();
        }
        return user;
    }
    public static List<Color> ObtenerColores(){
        List<Color> user = new List<Color>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Color";
            user = db.Query<Color>(sql).ToList();
        }
        return user;
    }
    public static List<Direccion> ObtenerDirecciones(){
        List<Direccion> user = new List<Direccion>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Direccion";
            user = db.Query<Direccion>(sql).ToList();
        }
        return user;
    }
    public static List<Marca> ObtenerMarcas(){
        List<Marca> user = new List<Marca>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Marca";
            user = db.Query<Marca>(sql).ToList();
        }
        return user;
    }
    public static List<Modelo> ObtenerModelos(){
        List<Modelo> user = new List<Modelo>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Modelo";
            user = db.Query<Modelo>(sql).ToList();
        }
        return user;
    }
    public static List<Transmision> ObtenerTransmisiones(){
        List<Transmision> user = new List<Transmision>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Transmision";
            user = db.Query<Transmision>(sql).ToList();
        }
        return user;
    }
    
    /*Objetos*/
    public static Auto ObtenerAuto(int idAuto){
        Auto user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Auto WHERE IdAuto = @idAu";
            user = db.QueryFirstOrDefault<Auto>(sql, new {idAu = idAuto});
        }
        return user;
    }
    public static Usuario ObtenerUsuario(string username){
        Usuario user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Usuario WHERE Nombre = @nom";
            user = db.QueryFirstOrDefault<Usuario>(sql, new {nom = username});
        }
        return user;
    }
    public static List<Auto> ObtenerColor(int idColor){
        List<Auto> user = new List<Auto>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Auto WHERE IdColor = @idCol";
            user = db.Query<Auto>(sql, new {idCol = idColor}).ToList();
        }
        return user;
    }
    public static List<Auto> ObtenerDireccion(int idDireccion){
        List<Auto> user = new List<Auto>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Auto WHERE IdDireccion = @idDir";
            user = db.Query<Auto>(sql, new {idDir = idDireccion}).ToList();
        }
        return user;
    }
    public static List<Auto> ObtenerMarca(int idMarca){
        List<Auto> user = new List<Auto>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Auto WHERE IdMarca = @idMar";
            user = db.Query<Auto>(sql, new {idMar = idMarca}).ToList();
        }
        return user;
    }
    public static List<Auto> ObtenerModelo(int idModelo){
        List<Auto> user = new List<Auto>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Auto WHERE IdModelo = @idMod";
            user = db.Query<Auto>(sql, new {idMod = idModelo}).ToList();
        }
        return user;
    }
    public static List<Auto> ObtenerTransmision(int idTransmision){
        List<Auto> user = new List<Auto>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Auto WHERE IdTransmision = @idTran";
            user = db.Query<Auto>(sql, new {idTran = idTransmision}).ToList();
        }
        return user;
    }

    public static void CrearAuto(Auto nuevoAuto){
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "INSERT INTO Auto(Año, Kilometraje, Matricula, Disponible, Asientos, Motor, AireAcondicionado, ABS, Airbag, IdColor, IdTransmision, IdDireccion, IdMarca, IdUsuario, Imagen, IdModelo, Precio) VALUES (pAño, pKilometraje, pMatricula, pDisponible, pAsientos, pMotor, pAireAcondicionado, pABS, pAirbag, pIdColor, pIdTransmision, pIdDireccion, pIdMarca, pIdUsuario, pImagen, pIdModelo, pPrecio)";
            db.Execute(sql, new {pAño = nuevoAuto.Año, pKilometraje = nuevoAuto.Kilometraje, pMatricula = nuevoAuto.Matricula, pDisponible = nuevoAuto.Disponible, pAsientos = nuevoAuto.Asientos, pMotor = nuevoAuto.Motor, pAireAcondicionado = nuevoAuto.AireAcondicionado, pABS = nuevoAuto.ABS, pAirbag = nuevoAuto.Airbag, pIdColor = nuevoAuto.IdColor, pIdTransmision = nuevoAuto.IdTransmision, pIdDireccion = nuevoAuto.IdDireccion, pIdMarca = nuevoAuto.IdMarca, pIdUsuario = nuevoAuto.IdUsuario, pImagen = nuevoAuto.Imagen, pIdModelo = nuevoAuto.IdModelo, pPrecio = nuevoAuto.Precio});
        }
    }
}