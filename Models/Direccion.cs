public class Direccion{
    public int IdDireccion {get;set;}
    public string NombreDireccion {get;set;}

    public Direccion(){}

    public Direccion(int idDireccion, string direccion){
        IdDireccion = idDireccion;
        NombreDireccion = direccion;
    }
}