using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using System.IO;
using Microsoft.AspNetCore.Hosting;
using TP11.Models;

namespace TP11.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private IWebHostEnvironment Environment;

    public HomeController(IWebHostEnvironment environment)
    {
        Environment = environment;
    }

    public IActionResult Index()
    {
        ViewBag.NavBar = ",";
        return View();
    }

    public IActionResult Creditos(){
        return View("Creditos");
    }

    public IActionResult SignIn(string Email, string Password)
    {
        Password = BD.GetSHA256(Password);
        ViewBag.NavBar = ",";
        Usuario User = BD.ObtenerUsuario(Email);
        ViewBag.Usuario = User;
        if(User != null){ //Manejo de error
            TempData["UserEmail"] = User.Email;
        }
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
            contrasena = BD.GetSHA256(contrasena);
            Usuario user = new Usuario(0, DateTime.Now, nombre, email, telefono, "-", false, contrasena);
            TempData["UserEmail"] = user.Email;
            BD.CrearUsuario(user);
            return RedirectToAction("Home");
        }
        
    }
    public IActionResult MostrarUsuario(){
        string e = TempData["UserEmail"].ToString();
        Usuario UserActual = BD.ObtenerUsuario(e);
       
        ViewBag.AutosUsuario = BD.ObtenerAutosUsuario(UserActual.IdUsuario);

        ViewBag.nombreUsuario = UserActual.NombreUsuario;
        ViewBag.telefono = UserActual.Telefono;
        ViewBag.email = UserActual.Email;
        ViewBag.direccion = UserActual.Direccion;
        ViewBag.fechaN = UserActual.FechaNacimiento;
        ViewBag.admin = UserActual.Admin;
        TempData["UserEmail"] = e;
        return View("Usuario");
    }

    public IActionResult ProductoBuscado(string producto)
    {
            ViewBag.ListaColores = BD.ObtenerColores();
            ViewBag.ListaMarcas = BD.ObtenerMarcas();
            ViewBag.ListaModelos = BD.ObtenerModelos();
            ViewBag.ListaDirecciones = BD.ObtenerDirecciones();
            ViewBag.ListaTransmisiones = BD.ObtenerTransmisiones();
            List<Modelo>listaModelos = new List<Modelo>();
            listaModelos = BD.ObtenerModelos();
            List<Auto>listaAutos = new List<Auto>();
        
            if(producto != null){
                string productoMinuscula = producto.ToLower();
                 for(int i = 0; i<listaModelos.Count; i++){
                    if(listaModelos[i].NombreModelo.ToLower().IndexOf(productoMinuscula) != -1){
                        listaAutos.AddRange(BD.ObtenerAutoXModelo(listaModelos[i].IdModelo));
                    }
                ViewBag.buscado = producto;
            }
            }
            if(listaAutos.Count > 0){
                ViewBag.ListaAutos = listaAutos;
            }
            return View("Home");
    }
    public IActionResult Home(List<Auto> autos, int a)
    {   
        string e = TempData["UserEmail"].ToString();
        TempData["UserEmail"] = e;
        if(autos.Count == 0){
            ViewBag.ListaAutos = BD.ObtenerAutos();
        }else{
            ViewBag.ListaAutos = autos;
        }
        ViewBag.ListaColores = BD.ObtenerColores();
        ViewBag.ListaMarcas = BD.ObtenerMarcas();
        ViewBag.ListaModelos = BD.ObtenerModelos();
        ViewBag.ListaDirecciones = BD.ObtenerDirecciones();
        ViewBag.ListaTransmisiones = BD.ObtenerTransmisiones();

        return View();
    }
    public IActionResult Filtro(string filtro, int Id, List<Auto> ListaAutosPervia)
    {
        ViewBag.ListaColores = BD.ObtenerColores();
        ViewBag.ListaMarcas = BD.ObtenerMarcas();
        ViewBag.ListaModelos = BD.ObtenerModelos();
        ViewBag.ListaDirecciones = BD.ObtenerDirecciones();
        ViewBag.ListaTransmisiones = BD.ObtenerTransmisiones();
        List<Auto> ListaAutos = new List<Auto>();
        switch(filtro){
            case "Color":
                ViewBag.ListaAutos = BD.ObtenerAutoXColor(Id, ListaAutosPervia);
                break;
            case "Marca":
                ViewBag.ListaAutos = BD.ObtenerAutoXMarca(Id); 
                break;
            case "Modelo":
                ViewBag.ListaAutos = BD.ObtenerAutoXModelo(Id); 
                break;
            case "Direccion":
                ViewBag.ListaAutos = BD.ObtenerAutoXDireccion(Id); 
                break;
            case "Transmision":
                ViewBag.ListaAutos = BD.ObtenerAutoXTransmision(Id); 
                break;
        }
        return View("Home");
    }

    public IActionResult CargarAuto(IFormFile MyFile){
        ViewBag.ListaColores = BD.ObtenerColores();
        ViewBag.ListaMarcas = BD.ObtenerMarcas();
        ViewBag.ListaModelos = BD.ObtenerModelos();
        string e = TempData["UserEmail"].ToString();
        TempData["UserEmail"] = e;
        Usuario UserActual = BD.ObtenerUsuario(e);

        ViewBag.IdUsuario = UserActual.IdUsuario;

        return View();
    }

    [HttpPost]
    public IActionResult CargarDatosAuto(int Ano, int Kilometraje, string Matricula, int Asientos, string Motor, bool AireAcondicionado, bool ABS, bool Airbag, int IdColor, int IdTransmision, int IdDireccion, int IdMarca, IFormFile MyFile, int IdModelo, int Precio, int IdUsuario){
        if(MyFile.Length>0){
            string wwwRootLocal = this.Environment.ContentRootPath + @"\wwwroot\img-autos\" + MyFile.FileName;
            using (var stream = System.IO.File.Create(wwwRootLocal)){
                MyFile.CopyToAsync(stream);
            };
        }
        Auto auto = new Auto(0, Ano, Kilometraje, Matricula, true, Asientos, Motor, AireAcondicionado, ABS, Airbag, IdColor, IdTransmision, IdDireccion, IdMarca, IdUsuario, MyFile.FileName, IdModelo, Precio);

        BD.CrearAuto(auto);
        return RedirectToAction("Home");
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
    public IActionResult ActualizarAuto(int idAuto){
        BD.ActualizarAuto(idAuto);
        return RedirectToAction("Home");
    }

    public IActionResult RellenarUsuario(){
        return View("LlenarUsuario");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
