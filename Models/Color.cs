public class Color{
    public int IdColor {get;set;}
    public string NombreColor {get;set;}

    public Color(){}

    public Color(int idcolor, string color){
        IdColor = idcolor;
        NombreColor = color;
    }
}