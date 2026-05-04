using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using CRUD_with_EF.Data;
using CRUD_with_EF.Models;

namespace CRUD_with_EF.Controllers
{
    public class EmployeeController : Controller
    {
        private readonly AppDbContext _context;

        public EmployeeController(AppDbContext context)
        {
            _context = context;
        }

        //Read (List)
        public async Task<IActionResult> Index()
        {
            var employees = await _context.Employees.ToListAsync();
            return View(employees);
        }

        //Create (Get)
        public IActionResult Create()
        {
            return View();
        }

        //Create (Post)
        [HttpPost]
        public async Task<IActionResult> Create(Employee emp)
        {
            if (ModelState.IsValid)
            {
                _context.Employees.Add(emp);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(emp);
        }

        // 🔹 4. EDIT (GET)

        public async Task<IActionResult> Edit(int id)

        {

            var emp = await _context.Employees.FindAsync(id);

            if (emp == null) return NotFound();

            return View(emp);

        }

        // 🔹 5. EDIT (POST)

        [HttpPost]

        public async Task<IActionResult> Edit(Employee emp)

        {

            if (ModelState.IsValid)

            {

                _context.Update(emp);

                await _context.SaveChangesAsync();

                return RedirectToAction(nameof(Index));

            }

            return View(emp);

        }

        // 🔹 6. DELETE (GET)

        public async Task<IActionResult> Delete(int id)

        {

            var emp = await _context.Employees.FindAsync(id);

            if (emp == null) return NotFound();

            return View(emp);

        }

        // 🔹 7. DELETE (POST)

        [HttpPost, ActionName("Delete")]

        public async Task<IActionResult> DeleteConfirmed(int id)

        {

            var emp = await _context.Employees.FindAsync(id);

            _context.Employees.Remove(emp);

            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));

        }

    }
}