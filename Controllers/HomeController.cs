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
        if(TempData["UserEmail"] != null){
            string e = TempData["UserEmail"].ToString();
            TempData["UserEmail"] = e;
            return View("Creditos");
        }
        else{
            return RedirectToAction("Index");
        }
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
            Response.StatusCode = 400;
            return View("Index");
        }
        Response.StatusCode = 400;
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
        if (TempData["UserEmail"] != null){
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
        else{
            return RedirectToAction("Index");
        }
    }

    public IActionResult ProductoBuscado(string producto)
    {
        if(TempData["UserEmail"] != null){
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
        else{
            return RedirectToAction("Index");
        }
    }
    public IActionResult Home(List<Auto> autos, int a)
    {   
        if(TempData["UserEmail"] != null){
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
        else{
            return RedirectToAction("Index");
        }
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
        if(TempData["UserEmail"] != null){
            ViewBag.ListaColores = BD.ObtenerColores();
            ViewBag.ListaMarcas = BD.ObtenerMarcas();
            string e = TempData["UserEmail"].ToString();
            TempData["UserEmail"] = e;
            Usuario UserActual = BD.ObtenerUsuario(e);
            ViewBag.IdUsuario = UserActual.IdUsuario;

            int pasoActual = TempData.ContainsKey("PasoActualKey") ? (int)TempData["PasoActualKey"] : 1;

            switch (pasoActual)
            {
                case 1:
                    return View("CargarAuto1");
                case 2:
                    int idMarca = Convert.ToInt32(TempData["Marca"]);
                    TempData["Marca"] = idMarca;
                    ViewBag.ListaModelos = BD.ObtenerModelosXMarca(idMarca);
                    return View("CargarAuto2");
                case 3:
                    return View("CargarAuto3");
                case 4:
                    return View("CargarAuto4");
                default:
                    return RedirectToAction("CargarAuto");
            }
        }
        else{
            return RedirectToAction("Index");
        }
        
    }
    [HttpPost]
    public IActionResult CargarDatos1(int Kilometraje, string Matricula, string Motor, int IdMarca){
        TempData["Marca"] = IdMarca;
        TempData["Motor"] = Motor;
        TempData["Matricula"] = Matricula;
        TempData["Kilometraje"] = Kilometraje;
        TempData["PasoActualKey"] = 2;

        return RedirectToAction("CargarAuto");
    }

    [HttpPost]
    public IActionResult CargarDatos2(int Ano, int Asientos, int IdColor, int IdModelo){
        TempData["Ano"] = Ano;
        TempData["Asientos"] = Asientos;
        TempData["Color"] = IdColor;
        TempData["Modelo"] = IdModelo;

        TempData["PasoActualKey"] = 3;

        return RedirectToAction("CargarAuto");
    }

    [HttpPost]
    public IActionResult CargarDatos3(bool AireAcondicionado, bool Airbag, bool ABS, int IdTransmision, int IdDireccion){
        TempData["Aire"] = AireAcondicionado;
        TempData["Airbag"] = Airbag;
        TempData["ABS"] = ABS;
        TempData["Transmision"] = IdTransmision;
        TempData["Direccion"] = IdDireccion;

        TempData["PasoActualKey"] = 4;

        return RedirectToAction("CargarAuto");
    }

    [HttpPost]
    public IActionResult CargarDatos4(IFormFile MyFile, int Precio, int IdUsuario){
        if(MyFile.Length>0){
            string wwwRootLocal = this.Environment.ContentRootPath + @"\wwwroot\img-autos\" + MyFile.FileName;
            using (var stream = System.IO.File.Create(wwwRootLocal)){ //DA ERROR SI SE USA UN ARCHIVO DE LA CARPETA
                MyFile.CopyToAsync(stream);
            };
        }

        int marca = Convert.ToInt32(TempData["Marca"]);
        string motor = TempData["Motor"].ToString();
        string matricula = TempData["Matricula"].ToString();
        int kilometraje = Convert.ToInt32(TempData["Kilometraje"]);
        int modelo = Convert.ToInt32(TempData["Modelo"]);
        int color = Convert.ToInt32(TempData["Color"]);
        int anioPublicacion = Convert.ToInt32(TempData["Ano"]);
        int cantidadAsientos = Convert.ToInt32(TempData["Asientos"]);
        int transmision = Convert.ToInt32(TempData["Transmision"]);
        int direccion = Convert.ToInt32(TempData["Direccion"]);
        bool aireAcondicionado = (bool)TempData["Aire"];
        bool airbag = (bool)TempData["Airbag"];
        bool abs = (bool)TempData["ABS"];

        Auto auto = new Auto(0, anioPublicacion, kilometraje, matricula, true, cantidadAsientos, motor, aireAcondicionado, abs, airbag, color, transmision, direccion, marca, IdUsuario, MyFile.FileName, modelo, Precio);

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

    public IActionResult LlenarInformacion(string direccion, DateTime fechanacimiento){
        string e = TempData["UserEmail"].ToString();
        Usuario UserActual = BD.ObtenerUsuario(e);
        TempData["UserEmail"] = e;
        BD.UpdateUsuario(direccion, fechanacimiento, UserActual.IdUsuario);
        return RedirectToAction("MostrarUsuario");
    }

    public IActionResult RellenarUsuario(){
        if(TempData["UserEmail"] != null){
            string e = TempData["UserEmail"].ToString();
            TempData["UserEmail"] = e;
            Usuario UserActual = BD.ObtenerUsuario(e);

            ViewBag.nombreUsuario = UserActual.NombreUsuario;
            ViewBag.direccion = UserActual.Direccion;
            ViewBag.fechaN = UserActual.FechaNacimiento;
            return View("LlenarUsuario");
        }
        else{
            return RedirectToAction("Index");
        }
        
    }

    public IActionResult CerrarSesion(){
        string e = null;
        TempData["UserEmail"] = e;

        return RedirectToAction("MostrarUsuario");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

    [HttpPost]
    public IActionResult NuevoAuto(int Ano, int Kilometraje, string Matricula, bool Disponible, int Asientos, string Motor, bool AireAcondicionado, bool ABS, bool Airbag, int IdColor, int IdTransmision, int IdDireccion, int IdMarca, int IdUsuario, string Imagen, int IdModelo, int Precio){

        Auto auto = new Auto(0, Ano, Kilometraje, Matricula, Disponible, Asientos, Motor, AireAcondicionado, ABS, Airbag, IdColor, IdTransmision, IdDireccion, IdMarca, IdUsuario, Imagen, IdModelo, Precio);
        BD.CrearAuto(auto);
        return View("Home");
    }
}
