using Microsoft.AspNetCore.Mvc;
using CompanyApp.Models;
using CompanyApp.Services;

namespace CompanyApp.Controllers
{
    public class EmployeeController : Controller
    {
        private readonly EmployeeService _empServices;
        private readonly DepartmentService _deptServices;

        public EmployeeController(EmployeeService empService , DepartmentService deptService)
        {
            _empServices = empService;
            _deptServices = deptService;
        }

        public IActionResult Index()
        {
            var employees = _empServices.GetEmployees();
            return View(employees);
        }

        public IActionResult Create()
        {
            ViewBag.Departments = _deptServices.GetDepartments();
            return View();
        }
        [HttpPost]
        public IActionResult Create (Employee emp)
        {
            _empServices.AddEmployee(emp);
            return RedirectToAction("Index");
        }

        public IActionResult Edit(int id)
        {
            var emp = _empServices.GetEmployeeById(id);
            ViewBag.Departments = _deptServices.GetDepartments();
            return View(emp);
        }
        [HttpPost]
        public IActionResult Edit(Employee emp)
        {
            _empServices.UpdateEmployee(emp);
            return RedirectToAction("Index");
        }

        public IActionResult Delete(int id)
        {
            _empServices.DeleteEmployee(id);
            return RedirectToAction("Index");
        }
    }
}