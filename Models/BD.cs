using System.Data.SqlClient;
using Dapper;

public static class BD{
    private static string ConnectionString {get; set;} = @"Server=localhost;DataBase=BDAutosAlRio;Trusted_Connection=True;";

    /*Listas*/
    public static List<Auto> ObtenerAutos(){
        List<Auto> user = new List<Auto>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "sp_ObtenerAutos";
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
    public static Usuario ObtenerUsuario(string Email){
        Usuario user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Usuario WHERE Email = @email";
            user = db.QueryFirstOrDefault<Usuario>(sql, new {email = Email});
        }
        return user;
    }
    public static Color ObtenerColor(int idColor){
        Color user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Color WHERE IdColor = @idCo";
            user = db.QueryFirstOrDefault<Color>(sql, new {idCo = idColor});
        }
        return user;
    }
    public static Marca ObtenerMarca(int idMarca){
        Marca user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Marca WHERE IdMarca = @idMa";
            user = db.QueryFirstOrDefault<Marca>(sql, new {idMa = idMarca});
        }
        return user;
    }
    public static Modelo ObtenerModelo(int idModelo){
        Modelo user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Modelo WHERE IdModelo = @idMo";
            user = db.QueryFirstOrDefault<Modelo>(sql, new {idMo = idModelo});
        }
        return user;
    }
    public static Direccion ObtenerDireccion(int idDireccion){
        Direccion user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Direccion WHERE IdDireccion = @idDi";
            user = db.QueryFirstOrDefault<Direccion>(sql, new {idDi = idDireccion});
        }
        return user;
    }
    public static Transmision ObtenerTransmision(int idTransmision){
        Transmision user;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Transmision WHERE IdTransmision = @idTr";
            user = db.QueryFirstOrDefault<Transmision>(sql, new {idTr = idTransmision});
        }
        return user;
    }

    /*Filtro*/
    public static List<Auto> ObtenerAutoXColor(int idColor){
        List<Auto> user = new List<Auto>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Auto WHERE IdColor = @idCol";
            user = db.Query<Auto>(sql, new {idCol = idColor}).ToList();
        }
        return user;
    }
    public static List<Auto> ObtenerAutoXDireccion(int idDireccion){
        List<Auto> user = new List<Auto>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Auto WHERE IdDireccion = @idDir";
            user = db.Query<Auto>(sql, new {idDir = idDireccion}).ToList();
        }
        return user;
    }
    public static List<Auto> ObtenerAutoXMarca(int idMarca){
        List<Auto> user = new List<Auto>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Auto WHERE IdMarca = @idMar";
            user = db.Query<Auto>(sql, new {idMar = idMarca}).ToList();
        }
        return user;
    }
    public static List<Auto> ObtenerAutoXModelo(int idModelo){
        List<Auto> user = new List<Auto>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Auto WHERE IdModelo = @idMod";
            user = db.Query<Auto>(sql, new {idMod = idModelo}).ToList();
        }
        return user;
    }
    public static List<Auto> ObtenerAutoXTransmision(int idTransmision){
        List<Auto> user = new List<Auto>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Auto WHERE IdTransmision = @idTran";
            user = db.Query<Auto>(sql, new {idTran = idTransmision}).ToList();
        }
        return user;
    }

    public static string ObtenerNombreModelo(int idModelo){
        string nombreModelo = "";
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT NombreModelo FROM Modelo WHERE IdModelo = @idMod";
            nombreModelo = db.QueryFirstOrDefault<string>(sql, new {idMod = idModelo});
        }
        return nombreModelo;
    }

    /*Creacion y verificacion*/
    public static void CrearAuto(Auto nuevoAuto){
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "INSERT INTO Auto(Ano, Kilometraje, Matricula, Disponible, Asientos, Motor, AireAcondicionado, ABS, Airbag, IdColor, IdTransmision, IdDireccion, IdMarca, IdUsuario, Imagen, IdModelo, Precio) VALUES (@pAño, @pKilometraje, @pMatricula, @pDisponible, @pAsientos, @pMotor, @pAireAcondicionado, @pABS, @pAirbag, @pIdColor, @pIdTransmision, @pIdDireccion, @pIdMarca, @pIdUsuario, @pImagen, @pIdModelo, @pPrecio)";
            db.Execute(sql, new {pAño = nuevoAuto.Ano, pKilometraje = nuevoAuto.Kilometraje, pMatricula = nuevoAuto.Matricula, pDisponible = nuevoAuto.Disponible, pAsientos = nuevoAuto.Asientos, pMotor = nuevoAuto.Motor, pAireAcondicionado = nuevoAuto.AireAcondicionado, pABS = nuevoAuto.ABS, pAirbag = nuevoAuto.Airbag, pIdColor = nuevoAuto.IdColor, pIdTransmision = nuevoAuto.IdTransmision, pIdDireccion = nuevoAuto.IdDireccion, pIdMarca = nuevoAuto.IdMarca, pIdUsuario = nuevoAuto.IdUsuario, pImagen = nuevoAuto.Imagen, pIdModelo = nuevoAuto.IdModelo, pPrecio = nuevoAuto.Precio});
        }
    }

    public static void CrearUsuario(Usuario user){
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "INSERT INTO Usuario(NombreUsuario, Email, Telefono, Contrasena, Admin) VALUES (@nombre, @email, @telefono, @contrasena, @admin)";
            db.Execute(sql, new {nombre = user.NombreUsuario, email = user.Email, telefono = user.Telefono, contrasena = user.GetContrasena(), admin = user.Admin});
        }
    }

    public static bool ExisteUsuario(string Email){
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Usuario WHERE Email = @email";
            if((db.QueryFirstOrDefault(sql, new {email = Email})) == null){
                return false;
            }else{
                return true;
            }
        }
    }
}