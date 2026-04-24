using Microsoft.AspNetCore.Mvc;
using EmployeeApplication.Services;
using EmployeeApplication.Models;

namespace EmployeeApplication.Controllers
{
    public class EmployeeController : Controller
    {
        private readonly EmployeeService _service;

        public EmployeeController(EmployeeService service)
        {
            _service = service;
        }

        // GET ALL
        public IActionResult Index()
        {
            var employees = _service.GetEmployees();
            return View(employees);
        }

        // CREATE (GET)
        public IActionResult Create()
        {
            return View();
        }

        // CREATE (POST)
        [HttpPost]
        public IActionResult Create(Employee emp)
        {
            _service.AddEmployee(emp);
            return RedirectToAction("Index");
        }

        // EDIT (GET)
        public IActionResult Edit(int id)
        {
            var emp = _service.GetEmployeeById(id);
            return View(emp);
        }

        // EDIT (POST)
        [HttpPost]
        public IActionResult Edit(Employee emp)
        {
            _service.UpdateEmployee(emp);
            return RedirectToAction("Index");
        }

        // DELETE
        public IActionResult Delete(int id)
        {
            _service.DeleteEmployee(id);
            return RedirectToAction("Index");
        }
    }
}