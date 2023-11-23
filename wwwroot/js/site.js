function masInfo(id){
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
            $("#anio").html(response.auto.ano);
            $("#km").html(response.auto.kilometraje);
            $("#matricula").html(response.auto.matricula);
            $("#Asientos").html(response.auto.Asientos);
            $("#Motor").html(response.auto.Motor);
            $("#Aire").html(response.auto.AireAcondicionado);
            $("#ABS").html(response.auto.ABS);
            $("#Airbag").html(response.auto.Airbag);
            $("#Color").html(response.color.NombreColor);
            $("#Transmision").html(response.transmision.NombreTransmision);
            $("#Direccion").html(response.direccion.NombreDireccion);
            $("#Marca").html(response.marca.NombreMarca);
            $("#Modelo").html(response.modelo.NombreModelo);
            $("#Precio").html(response.auto.Precio);
        }
    }
)
}