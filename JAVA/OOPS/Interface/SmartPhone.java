package OOPS.Interface;

public class SmartPhone implements Camera {

    @Override
    public void clicksPhoto() {
        System.out.println("clicking the photo!");
    }

    @Override
    public void recordVideo() {
        System.out.println("Taking a video!");
    }

    @Override
    public void playMusic() {
        System.out.println("Playing music");
    }

    @Override
    public void stopMusic() {
        System.out.println("Stopping music");
    }

    @Override
    public void makeCall() {
        System.out.println("Call START");
    }

    @Override
    public void endCall() {
        System.out.println("Call END");
    }
}
