public class Patient extends Person implements Billable {
    private final double treatmentCost;

    public Patient(String name, int age, double treatmentCost) {
        super(name, age);
        this.treatmentCost = treatmentCost;
    }

    @Override
    public String getRole() {
        return "Patient";
    }

    @Override
    public void generateBill() {
        System.out.println("----- Patient Bill -----");
        System.out.println("Patient Name: " + getName());
        System.out.println("Treatment Cost: " + treatmentCost);
        System.out.println("Total Bill: " + treatmentCost);
    }
}
