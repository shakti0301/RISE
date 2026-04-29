using Microsoft.AspNetCore.Mvc;
using EmpTravelMVC.Interfaces;
using EmpTravelMVC.Models;

namespace EmpTravelMVC.Controllers
{
    public class TravelController : Controller
    {
        private readonly ITravelRepository _repo;

        public TravelController(ITravelRepository repo)
        {
            _repo = repo;
        }

        // 🔹 READ
        public IActionResult Index()
        {
            var data = _repo.GetAll();
            return View(data);
        }

        // 🔹 CREATE (GET)
        public IActionResult Create()
        {
            return View();
        }

        // 🔹 CREATE (POST)
        [HttpPost]
        public IActionResult Create(TravelRequest request)
        {
            _repo.Add(request);
            return RedirectToAction("Index");
        }

        // 🔹 DETAILS
        public IActionResult Details(int id)
        {
            var request = _repo.GetById(id);
            if (request == null) return NotFound();
            return View(request);
        }

        // 🔹 EDIT (GET)
        public IActionResult Edit(int id)
        {
            var request = _repo.GetById(id);
            if (request == null) return NotFound();
            return View(request);
        }

        // 🔹 EDIT (POST)
        [HttpPost]
        public IActionResult Edit(TravelRequest request)
        {
            _repo.Update(request);
            return RedirectToAction("Index");
        }

        // 🔹 DELETE
        public IActionResult Delete(int id)
        {
            _repo.Delete(id);
            return RedirectToAction("Index");
        }
    }
}