public class Auto{
    public int IdAuto {get; set;}
    public int Anio {get; set;}
    public int Kilometraje {get; set;}
    public string Matricula {get; set;}
    public bool Disponible {get; set;}
    public int Asientos {get; set;}
    public string Motor {get; set;}
    public bool AireAcondicionado {get; set;}
    public bool ABS {get; set;}
    public bool Airbag {get; set;}
    public int IdColor {get; set;}
    public int IdTransmision {get; set;}
    public int IdDireccion {get; set;}
    public int IdMarca {get; set;}
    public int IdUsuario {get; set;}
    public string Imagen {get; set;}
    public int IdModelo {get; set;}
    public double Precio {get; set;}

    public Auto(){}
    public Auto(int idAu, int an, int km, string matr, bool dispo, int asi, string mtr, bool aire, bool ab, bool airb, int idCo, int idTr, int idDi, int idMa, int idUs, string img, int idMo, double prec){
        IdAuto = idAu;
        Anio = an;
        Kilometraje = km;
        Matricula = matr;
        Disponible = dispo;
        Asientos = asi;
        Motor = mtr;
        AireAcondicionado = aire;
        ABS = ab;
        Airbag = airb;
        IdColor = idCo;
        IdTransmision = idTr;
        IdDireccion = idDi;
        IdMarca = idMa;
        IdUsuario = idUs;
        Imagen = img;
        IdModelo = idMo;
        Precio = prec;
    }
}