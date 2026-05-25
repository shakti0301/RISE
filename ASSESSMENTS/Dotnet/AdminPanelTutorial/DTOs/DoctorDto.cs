using System.ComponentModel.DataAnnotations;

namespace AdminPanelTutorial.DTO
{
    public class DoctorDto
    {
        [Required]
        public string Name { get; set; } = string.Empty;
        [Required]
        public string Specialty { get; set; } = string.Empty;
        [Required]
        [EmailAddress]
        public string Email { get; set; } = string.Empty;
    }
}