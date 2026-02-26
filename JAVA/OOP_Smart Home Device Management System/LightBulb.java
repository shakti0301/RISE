package OOP_Problem;

public class LightBulb extends SmartDevice {
    private boolean isOn;
    private int brightness = 100;

    @Override
    public String deviceType() {
        return "LightBulb";
    }

    @Override
    public void performAction(String action) throws InvalidActionException {
        String normalized = action == null ? "" : action.trim().toLowerCase();

        if ("on".equals(normalized)) {
            isOn = true;
            rememberState(currentState());
            System.out.println("LightBulb: Light turned ON");
            return;
        }

        if ("off".equals(normalized)) {
            isOn = false;
            rememberState(currentState());
            System.out.println("LightBulb: Light turned OFF");
            return;
        }

        if (normalized.startsWith("brightness:")) {
            String value = normalized.substring("brightness:".length()).trim();
            int level;
            try {
                level = Integer.parseInt(value);
            } catch (NumberFormatException e) {
                throw new InvalidActionException("LightBulb brightness must be numeric.");
            }
            if (level < 0 || level > 100) {
                throw new InvalidActionException("LightBulb brightness must be between 0 and 100.");
            }
            brightness = level;
            rememberState(currentState());
            System.out.println("LightBulb: Brightness changed to " + brightness + "%");
            return;
        }

        throw new InvalidActionException(
                "Unsupported LightBulb action. Use: on, off, brightness:<0-100>."
        );
    }

    private String currentState() {
        return "power=" + (isOn ? "ON" : "OFF") + ", brightness=" + brightness + "%";
    }
}
