using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP11.Models;

namespace TP11.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        ViewBag.NavBar = ",";
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    public IActionResult SignIn(string Email, string Password)
    {
        ViewBag.NavBar = ",";
        Usuario User = BD.ObtenerUsuario(Email);
        ViewBag.Usuario = User;
        if(BD.ObtenerUsuario(Email) == null || User.GetContrasena() != Password){
            ViewBag.Error = "Usuario o contraseña incorrectos";
            return View("Index");
        }
        return RedirectToAction("Home");
        
    }
    public IActionResult SignUp(string nombre, string email, string contrasena, string telefono)
    {   
        ViewBag.NavBar = ",";
        if(BD.ExisteUsuario(email) == true){
            ViewBag.Error = "Ya existe ese usuario ingrese un Email diferente";
            return View("Index");
        }else{
            Usuario user = new Usuario(0, DateTime.Now, nombre, email, telefono, "-", false, contrasena);
            BD.CrearUsuario(user);
            return RedirectToAction("Home");
        }
        
    }

    public IActionResult ProductoBuscado(string producto)
    {       ViewBag.ListaAutos = BD.ObtenerAutos();
            ViewBag.ListaColores = BD.ObtenerColores();
            ViewBag.ListaMarcas = BD.ObtenerMarcas();
            ViewBag.ListaModelos = BD.ObtenerModelos();
            ViewBag.ListaDirecciones = BD.ObtenerDirecciones();
            ViewBag.ListaTransmisiones = BD.ObtenerTransmisiones();
            //toto arreglalo puto
            string productoMinuscula = producto.ToLower();
            List<Modelo>listaModelos = new List<Modelo>();
            listaModelos = BD.ObtenerModelos();
            List<Auto>listaAutos = new List<Auto>();

            for(int i = 0; i<listaModelos.Count; i++){
                if(listaModelos[i].NombreModelo.ToLower().IndexOf(productoMinuscula) != -1){
                    listaAutos.AddRange(BD.ObtenerModelo(listaModelos[i].IdModelo));
                }
            }
            ViewBag.buscado = producto;

            if(listaAutos.Count > 0){
                ViewBag.ListaAutos = listaAutos;
            }

            return View("Home");
    }
    public IActionResult Home()
    {   
        ViewBag.ListaAutos = BD.ObtenerAutos();
        ViewBag.ListaColores = BD.ObtenerColores();
        ViewBag.ListaMarcas = BD.ObtenerMarcas();
        ViewBag.ListaModelos = BD.ObtenerModelos();
        ViewBag.ListaDirecciones = BD.ObtenerDirecciones();
        ViewBag.ListaTransmisiones = BD.ObtenerTransmisiones();

        return View();
    }
    public IActionResult Filtro(string filtro, int Id)
    {
        ViewBag.ListaColores = BD.ObtenerColores();
        ViewBag.ListaMarcas = BD.ObtenerMarcas();
        ViewBag.ListaModelos = BD.ObtenerModelos();
        ViewBag.ListaDirecciones = BD.ObtenerDirecciones();
        ViewBag.ListaTransmisiones = BD.ObtenerTransmisiones();
        List<Auto> ListaAutos = new List<Auto>();
        switch(filtro){
            case "color":
                ViewBag.ListaAutos = BD.ObtenerColor(Id); 
                break;
            case "marca":
                ViewBag.ListaAutos = BD.ObtenerMarca(Id); 
                break;
            case "modelo":
                ViewBag.ListaAutos = BD.ObtenerModelo(Id); 
                break;
            case "direccion":
                ViewBag.ListaAutos = BD.ObtenerDireccion(Id); 
                break;
            case "transmision":
                ViewBag.ListaAutos = BD.ObtenerTransmision(Id); 
                break;
        }
        return View("Home");
    }

    public IActionResult CargarAuto(){
        return View();
    }

    public Object VerInformacionAuto(int idAuto){
        Auto MiAuto = BD.ObtenerAuto(idAuto); 
        var Objeto = new {
            auto = MiAuto,
            modelo = BD.ObtenerModelo(MiAuto.IdModelo),
            color = BD.ObtenerColor(MiAuto.IdColor),
            transmision = BD.ObtenerTransmision(MiAuto.IdTransmision),
            direccion = BD.ObtenerDireccion(MiAuto.IdDireccion),
            marca = BD.ObtenerMarca(MiAuto.IdMarca)
        };
        return Objeto;
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
