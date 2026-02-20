
public class Main {
    public static void main(String[] args) {
        Person doctor = new Doctor("Dr. Shakti", 40, "Cardiology");
        Person patient = new Patient("Ravi Kumar", 28, 15000.0);

        displayPersonDetails(doctor);
        System.out.println();
        displayPersonDetails(patient);
        System.out.println();

        if (patient instanceof Billable) {
            Billable billablePatient = (Billable) patient;
            billablePatient.generateBill();
        }
    }

    private static void displayPersonDetails(Person person) {
        person.displayInfo();
        System.out.println("Role: " + person.getRole());
    }
}
