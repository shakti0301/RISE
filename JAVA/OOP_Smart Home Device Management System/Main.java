package OOP_Problem;

public class Main {
    public static void main(String[] args) {
        SmartHomeSystem system = new SmartHomeSystem();

        SmartDevice lightBulb = new LightBulb();
        SmartDevice thermostat = new Thermostat();
        SmartDevice securityCamera = new SecurityCamera();

        system.addDevice(lightBulb);
        system.addDevice(thermostat);
        system.addDevice(securityCamera);

        system.executeAction(lightBulb, "on");
        system.executeAction(lightBulb, "brightness:75");
        system.executeAction(lightBulb, "brightness:150");

        system.executeAction(thermostat, "set:24");
        system.executeAction(thermostat, "turn_on");

        system.executeAction(securityCamera, "on");
        system.executeAction(securityCamera, "record:start");
        system.executeAction(securityCamera, "record:stop");
        system.executeAction(securityCamera, "zoom");

        System.out.println();
        lightBulb.restoreLastState();
        thermostat.restoreLastState();
        securityCamera.restoreLastState();

        system.printActionLog();
    }
}
