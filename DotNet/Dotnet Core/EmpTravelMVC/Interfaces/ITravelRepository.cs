using EmpTravelMVC.Models;

namespace EmpTravelMVC.Interfaces
{
    public interface ITravelRepository
    {
        List<TravelRequest> GetAll();
        TravelRequest GetById(int id);
        void Add(TravelRequest request);
        void Update(TravelRequest request);
        void Delete(int id);
    }
}