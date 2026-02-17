package OOPS.Functions;

public class TrafficManagement {
    static{
        System.out.println("Hi");
    }
    public void displaySignal(TrafficSignals signals){
        switch (signals){
            case red -> System.out.println("Stop your car");
            case yellow -> System.out.println("Be ready to move");
            case green -> System.out.println("Start moving");
        }
    }
}
