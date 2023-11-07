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
<<<<<<< HEAD
    public IActionResult Home()
    {
        ViewBag.ListaAutos = BD.ObtenerAutos();
        return View();
    }
    public IActionResult Filtro(string filtro, string Id)
=======
    public IActionResult Filtro(string filtro)
>>>>>>> 9adbf77927473cf12a09b04a1b51ee9cdeb25ba7
    {
        switch(filtro){
            case "color":
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
