using System;

namespace EmpTravelMVC.Models
{
    public class TravelRequest
    {
        public int RequestId { get; set; }
        public int EmployeeId { get; set; }
        public string Destination { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string Status { get; set; }
    }
}