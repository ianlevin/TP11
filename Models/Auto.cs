public class Auto{
    public int IdAuto {get; set;}
    public string Modelo {get; set;}
    public string Color {get; set;}
    public int Ano {get; set;}
    public int Kilometraje {get; set;}
    public string Matricula {get; set;}
    public bool Disponible {get; set;}
    public int Asientos {get; set;}
    public string Transmision {get; set;}
    public string Motor {get; set;}
    public bool AireAcondicionado {get; set;}
    public bool ABS {get; set;}
    public bool Airbag {get; set;}
    public string Direccion {get; set;}
    public int IdMarca {get; set;}
    
    public Auto(){}

    public Auto(int idAu, string mod, string col, int anio, int km, string matr, bool dispo, int asi, string trans, string mot, bool aire, bool ab, bool airb, string dir, int idM){
        IdAuto = idAu;
        Modelo = mod;
        Color = col;
        Ano = anio;
        Kilometraje = km;
        Matricula = matr;
        Disponible = dispo;
        Asientos = asi;
        Transmision = trans;
        Motor = mot;
        AireAcondicionado = aire;
        ABS = ab;
        Airbag = airb;
        Direccion = dir;
        IdMarca = idM;
    }
}