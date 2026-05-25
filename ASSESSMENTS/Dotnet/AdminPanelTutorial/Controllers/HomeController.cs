using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using AdminPanelTutorial.Models;
using AdminPanelTutorial.Services.Interfaces;
using AdminPanelTutorial.DTO;

namespace AdminPanelTutorial.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly IDoctorService _service;

    public HomeController(ILogger<HomeController> logger, IDoctorService service)
    {
        _logger = logger;
        _service = service;
    }

    public async Task<ActionResult> Index()
    {
        var doctors = await _service.GetAll();
        return View(doctors);
    }

    public IActionResult Create()
    {
        return View();
    }

    [HttpPost]
    public ActionResult Create(DoctorDto dto)
    {
        _service.Create(dto);
        return View();
    }
    
    public IActionResult Update()
    {
        return View();
    }



    [HttpPut("{id}")]
    public ActionResult Update(int id, DoctorDto dto)
    {
        _service.Update(id, dto);
        return View();
    }

    [HttpDelete("{id}")]
    public ActionResult Delete(int id)
    {
        _service.Delete(id);
        return View();
    }



    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
