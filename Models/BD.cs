using System.Data.SqlClient;
using Dapper;

public static class BD{
    private static string ConnectionString {get; set;} = @"Server=localhost;DataBase=BD_TP11;Trusted_Connection=True;";

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
    public static Marca ObtenerMarca(int idMarca){
        Marca user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Marca WHERE IdMarca = @idMar";
            user = db.QueryFirstOrDefault<Marca>(sql, new {idMar = idMarca});
        }
        return user;
    }
    public static void CrearAuto(string Username, string Contrasena, string Nombre, string Apellido, string Email, string preguntaSeguridad){
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "INSERT INTO Usuario(username, contrasena, nombre, apellido, email, preguntaSeguridad) VALUES (@Usuario, @Contra, @Nom, @Ape, @Em, @PS)";
            db.Execute(sql, new {Usuario = Username, Contra = Contrasena, Nom = Nombre, Ape = Apellido, Em = Email, PS = preguntaSeguridad});
        }
    }
}