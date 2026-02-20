public class Doctor extends Person {
    private final String specialization;

    public Doctor(String name, int age, String specialization) {
        super(name, age);
        this.specialization = specialization;
    }

    @Override
    public String getRole() {
        return "Doctor (Specialization: " + specialization + ")";
    }
}
