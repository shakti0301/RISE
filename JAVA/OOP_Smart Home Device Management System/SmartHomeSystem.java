package OOP_Problem;

import java.util.ArrayList;
import java.util.List;

public class SmartHomeSystem {
    private final List<SmartDevice> devices = new ArrayList<>();
    private final List<String> actionLog = new ArrayList<>();

    public void addDevice(SmartDevice device) {
        devices.add(device);
    }

    public List<SmartDevice> getDevices() {
        return devices;
    }

    public void executeAction(SmartDevice device, String action) {
        try {
            device.performAction(action);
            String message = "[SUCCESS] " + device.deviceType() + " -> " + action;
            actionLog.add(message);
            System.out.println("System: " + message);
        } catch (InvalidActionException e) {
            String message = "[FAILED] " + device.deviceType() + " -> " + action + " | " + e.getMessage();
            actionLog.add(message);
            System.out.println("System: " + message);
        }
    }

    public void printActionLog() {
        System.out.println("\nAction Log:");
        for (String log : actionLog) {
            System.out.println(log);
        }
    }
}
