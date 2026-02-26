package OOP_Problem;

public class SecurityCamera extends SmartDevice {
    private boolean isOn;
    private boolean isRecording;

    @Override
    public String deviceType() {
        return "SecurityCamera";
    }

    @Override
    public void performAction(String action) throws InvalidActionException {
        String normalized = action == null ? "" : action.trim().toLowerCase();

        if ("on".equals(normalized)) {
            isOn = true;
            rememberState(currentState());
            System.out.println("SecurityCamera: Camera turned ON");
            return;
        }

        if ("off".equals(normalized)) {
            isOn = false;
            isRecording = false;
            rememberState(currentState());
            System.out.println("SecurityCamera: Camera turned OFF");
            return;
        }

        if ("record:start".equals(normalized)) {
            if (!isOn) {
                throw new InvalidActionException("SecurityCamera must be ON before recording.");
            }
            isRecording = true;
            rememberState(currentState());
            System.out.println("SecurityCamera: Recording started");
            return;
        }

        if ("record:stop".equals(normalized)) {
            if (!isOn) {
                throw new InvalidActionException("SecurityCamera is OFF. Cannot stop recording.");
            }
            isRecording = false;
            rememberState(currentState());
            System.out.println("SecurityCamera: Recording stopped");
            return;
        }

        throw new InvalidActionException(
                "Unsupported SecurityCamera action. Use: on, off, record:start, record:stop."
        );
    }

    private String currentState() {
        return "power=" + (isOn ? "ON" : "OFF") + ", recording=" + (isRecording ? "YES" : "NO");
    }
}
