public class Transmision{
    public int IdTransmision {get;set;}
    public string NombreTransmision {get;set;}

    public Transmision(){}

    public Transmision(int idtransmision, string transmision){
        IdTransmision = idtransmision;
        NombreTransmision = transmision;
    }
}