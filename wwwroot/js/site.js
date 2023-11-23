function MostrarAuto(id){
$.ajax(
    {
        type: 'POST',
        dataType: 'JSON',
        url: '/Home/VerInformacionAuto',
        data: {IdAuto: id},
        success:
        function (response){
            console.log(response);
            $("#titulo").html(response.modelo.nombreModelo);
            $("#anio").html("Año: "+response.auto.ano);
            $("#km").html("Kilometraje: "+response.auto.kilometraje+"km");
            $("#matricula").html("Matricula: "+response.auto.matricula);
            $("#Asientos").html("Asientos: "+response.auto.Asientos);
            $("#Motor").html("Motor: "+response.auto.Motor);
            $("#Aire").html("Aire acondicionado: "+response.auto.AireAcondicionado);
            $("#ABS").html("ABS: "+response.auto.ABS);
            $("#Airbag").html("Airbag: "+response.auto.Airbag);
            $("#Color").html("Color: "+response.color.NombreColor);
            $("#Transmision").html("Transmision: "+response.transmision.NombreTransmision);
            $("#Direccion").html("Direccion: "+response.direccion.NombreDireccion);
            $("#Marca").html("Marca: "+response.marca.NombreMarca);
            $("#Precio").html("$"+response.auto.Precio);
        }
    }
)
}