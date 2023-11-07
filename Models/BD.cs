using System.Data.SqlClient;
using Dapper;

public static class BD{
    private static string ConnectionString {get; set;} = @"Server=localhost;DataBase=BD_TP11;Trusted_Connection=True;";


    public static Auto ObtenerAutos(){
        List<Auto> user = new List<Auto>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Auto";
            user = db.Query<Auto>(sql).ToList();
        }
        return user;
    }
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
}
