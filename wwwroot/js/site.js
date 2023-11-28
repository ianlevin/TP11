function MostrarAuto(id){
$.ajax(
    {
        type: 'POST',
        dataType: 'JSON',
        url: '/Home/VerInformacionAuto',
        data: {IdAuto: id},
        success:
        function (response){
            $("#imagen").attr("src", response.auto.urlImagen);
            $("#titulo").html(response.modelo.nombreModelo);
            $("#anio").html("Año: "+response.auto.ano);
            $("#km").html("Kilometraje: "+response.auto.kilometraje+"km");
            $("#matricula").html("Matricula: "+response.auto.matricula);
            $("#Asientos").html("Asientos: "+response.auto.asientos);
            $("#Motor").html("Motor: "+response.auto.motor);
            if(response.auto.aireAcondicionado){
                $("#Aire").html("Tiene aire acondicionado");
            }
            else{
                $("#Aire").html("No tiene aire acondicionado");
            }
            if(response.auto.aBS){
                $("#ABS").html("Tiene ABS");
            }
            else{
                $("#ABS").html("No tiene ABS");
            }
            if(response.auto.airbag){
                $("#Airbag").html("Tiene Airbag");
            }
            else{
                $("#Airbag").html("No tiene Airbag");
            }
            $("#Color").html("Color: "+response.color.nombreColor);
            $("#Transmision").html("Transmision: "+response.transmision.nombreTransmision);
            $("#Direccion").html("Direccion: "+response.direccion.nombreDireccion);
            $("#Marca").html("Marca: "+response.marca.nombreMarca);
            $("#Precio").html("$"+response.auto.precio);
        }
    }
)
}