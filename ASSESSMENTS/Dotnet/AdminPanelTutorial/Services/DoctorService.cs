using AdminPanelTutorial.Data;
using AdminPanelTutorial.DTO;
using AdminPanelTutorial.Models;
using AdminPanelTutorial.Services.Interfaces;

namespace AdminPanelTutorial.Services
{
    public class DoctorService : IDoctorService
    {
        private readonly AppDbContext _context;
        public DoctorService(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Doctor>> GetAll()
        {
            var doctors = _context.Doctors.ToList();
            return doctors;
        }   

        public async Task Create(DoctorDto dto)
        {
            var doctor = new Doctor
            {
                Name = dto.Name,
                Specialty = dto.Specialty,
                Email = dto.Email
            };

            _context.Doctors.Add(doctor);
            await _context.SaveChangesAsync();
        }

        public async Task Update(int id, DoctorDto dto)
        {
            var doctor = _context.Doctors.FirstOrDefault(d => d.Id == id);
            if (doctor == null)
                return;

            doctor.Name = dto.Name;
            doctor.Specialty = dto.Specialty;
            doctor.Email = dto.Email;
            await _context.SaveChangesAsync();
        }

        public async Task Delete(int id)
        {
            var doctor = _context.Doctors.FirstOrDefault(d => d.Id == id);
            if (doctor == null)
                return;

            _context.Doctors.Remove(doctor);
            await _context.SaveChangesAsync();
        }
    }
}