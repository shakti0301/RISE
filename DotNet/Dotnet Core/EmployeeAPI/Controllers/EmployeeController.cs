using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using EmployeeAPI.Data;
using EmployeeAPI.Models;
using EmployeeAPI.DTOs;

namespace EmployeeAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly AppDbContext _context;

        public EmployeeController(AppDbContext context)
        {
            _context = context;
        }

        // GET
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var data = await _context.Employees.ToListAsync();
            return Ok(data);
        }

        // POST
        [HttpPost]
        public async Task<IActionResult> Create(EmployeeDTO dto)
        {
            var emp = new Employee
            {
                Name = dto.Name,
                Email = dto.Email
            };

            _context.Employees.Add(emp);
            await _context.SaveChangesAsync();

            return Ok(emp);
        }

        // PUT
        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, EmployeeDTO dto)
        {
            var emp = await _context.Employees.FindAsync(id);

            if (emp == null) return NotFound();

            emp.Name = dto.Name;
            emp.Email = dto.Email;

            await _context.SaveChangesAsync();

            return Ok(emp);
        }

        // DELETE
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var emp = await _context.Employees.FindAsync(id);

            if (emp == null) return NotFound();

            _context.Employees.Remove(emp);
            await _context.SaveChangesAsync();

            return Ok();
        }
    }
}