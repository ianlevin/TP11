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
        return View();
    }
    public IActionResult Filtro(string filtro, int Id)
    {
        switch(filtro){
            case "color":
                List<Auto> ListaAutos = BD.ObtenerColor(Id); 
                break;
            case "marca":
                List<Auto> ListaAutos = BD.ObtenerMarca(Id); 
                break;
            case "modelo":
                List<Auto> ListaAutos = BD.ObtenerModelo(Id); 
                break;
            case "direccion":
                List<Auto> ListaAutos = BD.ObtenerModelo(Id); 
                break;
            case "transmision":
                List<Auto> ListaAutos = BD.ObtenerModelo(Id); 
                break;
        }
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
