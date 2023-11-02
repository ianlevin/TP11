public class Marca{
    public int IdMarca {get; set;}
    public string Nombre {get; set;}
    public string Pais {get; set;}
    public string Direccion {get; set;}
    public string SitioWeb {get; set;}

    public Marca(){}
    public Marca(int idM, string nom, string pa, string dire, string web){
        IdMarca = idM;
        Nombre = nom;
        Pais = pa;
        Direccion = dire;
        SitioWeb = web;
    }
}