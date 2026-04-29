using Microsoft.AspNetCore.Mvc;
using EmpTravelMVC.Interfaces;
using EmpTravelMVC.Models;

namespace EmpTravelMVC.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TravelController : ControllerBase
    {
        private readonly ITravelRepository _repo;

        public TravelController(ITravelRepository repo)
        {
            _repo = repo;
        }

        // GET: api/travel
        [HttpGet]
        public IActionResult GetAll()
        {
            var data = _repo.GetAll();
            return Ok(data);
        }

        // GET: api/travel/5
        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            var request = _repo.GetById(id);
            if (request == null)
                return NotFound();

            return Ok(request);
        }

        // POST: api/travel
        [HttpPost]
        public IActionResult Create([FromBody] TravelRequest request)
        {
            _repo.Add(request);
            return Ok();
        }

        // PUT: api/travel
        [HttpPut]
        public IActionResult Update([FromBody] TravelRequest request)
        {
            _repo.Update(request);
            return Ok();
        }

        // DELETE: api/travel/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _repo.Delete(id);
            return Ok();
        }
    }
}