package OOP_Problem;

public abstract class SmartDevice {
    private String lastState = "UNSET";

    public abstract String deviceType();

    public abstract void performAction(String action) throws InvalidActionException;

    protected void rememberState(String state) {
        this.lastState = state;
    }

    public void restoreLastState() {
        System.out.println(deviceType() + " restored state -> " + lastState);
    }

    public String getLastState() {
        return lastState;
    }
}
