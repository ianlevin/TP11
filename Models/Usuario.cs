public class Usuario{
    public int IdUsuario {get; set;}
    public DateTime FechaNacimiento {get; set;}
    public string Nombre {get; set;}
    public string Email {get; set;}
    public string Telefono {get; set;}
    public string Direccion {get; set;}
    public bool Admin {get; set;}
    private string Contrasena {get;set;}

    public Usuario(){}
    public Usuario(int idU, DateTime fechaN, string nom, string em, string tel, string dire, bool adm, string contr){
        IdUsuario = idU;
        FechaNacimiento = fechaN;
        Nombre = nom;
        Email = em;
        Telefono = tel;
        Direccion = dire;
        Admin = adm;
        Contrasena = contr;
    }

    public string GetContrasena(){
        return Contrasena;
    }
}