package OOP_Problem;

public class Thermostat extends SmartDevice {
    private int temperature = 22;

    @Override
    public String deviceType() {
        return "Thermostat";
    }

    @Override
    public void performAction(String action) throws InvalidActionException {
        String normalized = action == null ? "" : action.trim().toLowerCase();
        String value = normalized;

        if (normalized.startsWith("set:")) {
            value = normalized.substring("set:".length()).trim();
        }

        int newTemp;
        try {
            newTemp = Integer.parseInt(value);
        } catch (NumberFormatException e) {
            throw new InvalidActionException("Thermostat action must be numeric or set:<temp>.");
        }

        if (newTemp < 10 || newTemp > 35) {
            throw new InvalidActionException("Thermostat temperature must be between 10 and 35.");
        }

        temperature = newTemp;
        rememberState("temperature=" + temperature + "C");
        System.out.println("Thermostat: Temperature set to " + temperature + "C");
    }

}
