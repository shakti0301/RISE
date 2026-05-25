using AdminPanelTutorial.DTO;
using AdminPanelTutorial.Models;

namespace AdminPanelTutorial.Services.Interfaces
{
    public interface IDoctorService
    {
        Task<IEnumerable<Doctor>> GetAll();
        Task Create(DoctorDto dto);
        Task Update(int id, DoctorDto dto);
        Task Delete(int id);
    }
}