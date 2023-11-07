public class Usuario{
    public int IdUsuario {get; set;}
    public DateTime FechaNacimiento {get; set;}
    public string Nombre {get; set;}
    public string Apellido {get; set;}
    public string Email {get; set;}
    public int Telefono {get; set;}
    public string Direccion {get; set;}
    public bool Admin {get; set;}
    private string Contrasena {get;set;}

    public Usuario(){}
    public Usuario(int idU, DateTime fechaN, string nom, string ape, string em, int tel, string dire, bool adm, string contr){
        IdUsuario = idU;
        FechaNacimiento = fechaN;
        Nombre = nom;
        Apellido = ape;
        Email = em;
        Telefono = tel;
        Direccion = dire;
        Admin = adm;
        Contrasena = contr;
    }
}