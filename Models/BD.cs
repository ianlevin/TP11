using System.Data.SqlClient;
using Dapper;

public static class BD{
    private static string ConnectionString {get; set;} = @"Server=localhost;DataBase=BD_TP11;Trusted_Connection=True;";

    /*Listas*/
    public static List<Auto> ObtenerAutos(){
        List<Auto> user = new List<Auto>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Auto";
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
    public static Usuario ObtenerUsuario(int idUsuario){
        Usuario user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Usuario WHERE IdUsuario = @idUs";
            user = db.QueryFirstOrDefault<Usuario>(sql, new {idUs = idUsuario});
        }
        return user;
    }
    public static Color ObtenerColor(int idColor){
        Color user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Color WHERE IdColor = @idCol";
            user = db.QueryFirstOrDefault<Color>(sql, new {idCol = idColor});
        }
        return user;
    }
    public static Direccion ObtenerDireccion(int idDireccion){
        Direccion user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Direccion WHERE IdDireccion = @idDir";
            user = db.QueryFirstOrDefault<Direccion>(sql, new {idDir = idDireccion});
        }
        return user;
    }
    public static Marca ObtenerMarca(int idMarca){
        Marca user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Marca WHERE IdMarca = @idMar";
            user = db.QueryFirstOrDefault<Marca>(sql, new {idMar = idMarca});
        }
        return user;
    }
    public static Modelo ObtenerModelo(int idModelo){
        Modelo user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Modelo WHERE IdModelo = @idMod";
            user = db.QueryFirstOrDefault<Modelo>(sql, new {idMod = idModelo});
        }
        return user;
    }
    public static Transmision ObtenerTransmision(int idTransmision){
        Transmision user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Transmision WHERE IdTransmision = @idTran";
            user = db.QueryFirstOrDefault<Transmision>(sql, new {idTran = idTransmision});
        }
        return user;
    }

    public static void CrearAuto(Auto nuevoAuto){
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "INSERT INTO Auto(Año, Kilometraje, Matricula, Disponible, Asientos, Motor, AireAcondicionado, ABS, Airbag, IdColor, IdTransmision, IdDireccion, IdMarca, IdUsuario, Imagen, IdModelo) VALUES (pAño, pKilometraje, pMatricula, pDisponible, pAsientos, pMotor, pAireAcondicionado, pABS, pAirbag, pIdColor, pIdTransmision, pIdDireccion, pIdMarca, pIdUsuario, pImagen, pIdModelo)";
            db.Execute(sql, new {pAño = nuevoAuto.Año, pKilometraje = nuevoAuto.Kilometraje, pMatricula = nuevoAuto.Matricula, pDisponible = nuevoAuto.Disponible, pAsientos = nuevoAuto.Asientos, pMotor = nuevoAuto.Motor, pAireAcondicionado = nuevoAuto.AireAcondicionado, pABS = nuevoAuto.ABS, pAirbag = nuevoAuto.Airbag, pIdColor = nuevoAuto.IdColor, pIdTransmision = nuevoAuto.IdTransmision, pIdDireccion = nuevoAuto.IdDireccion, pIdMarca = nuevoAuto.IdMarca, pIdUsuario = nuevoAuto.IdUsuario, pImagen = nuevoAuto.Imagen, pIdModelo = nuevoAuto.IdModelo});
        }
    }
}