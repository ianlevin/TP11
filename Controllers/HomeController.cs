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
        return View();
    }

    public IActionResult Privacy()
    {
        return View();{}
    }

    public IActionResult SignIn(string Email, string Password)
    {
        Usuario User = BD.ObtenerUsuario(Email);
        ViewBag.Usuario = User;
        if(BD.ObtenerUsuario(Email) == null || User.GetContrasena() != Password){
            ViewBag.Error = "Usuario o contraseña incorrectos";
            return View("Index");
        }
        return View("Home");
        
    }
    public IActionResult SignUp()
    {
        return RedirectToAction("SignIn");
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
        List<Auto> ListaAutos = new List<Auto>();
        switch(filtro){
            case "color":
                ListaAutos = BD.ObtenerColor(Id); 
                break;
            case "marca":
                ListaAutos = BD.ObtenerMarca(Id); 
                break;
            case "modelo":
                ListaAutos = BD.ObtenerModelo(Id); 
                break;
            case "direccion":
                ListaAutos = BD.ObtenerDireccion(Id); 
                break;
            case "transmision":
                ListaAutos = BD.ObtenerTransmision(Id); 
                break;
        }
        return View("Home");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
