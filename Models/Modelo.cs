public class Modelo{
    public int IdModelo {get;set;}
    public string NombreModelo {get;set;}

    public Modelo(){}

    public Modelo(int idModelo, string modelo){
        IdModelo = idModelo;
        NombreModelo = modelo;
    }
}