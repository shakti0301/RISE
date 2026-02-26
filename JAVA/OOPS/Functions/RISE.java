package OOPS.Functions;

public class RISE {

    int rollno;
    String name;
    String spe;

    public void getDetails(int rollno, String name, String spe){
        this.rollno = rollno;
        this.name = name;
        this.spe = spe;
    }

    public void GetDetails(int rollno, String name, String spe) {
        getDetails(rollno, name, spe);
    }

    public void display(){
        System.out.println(rollno + " " + name + " " + spe);
        System.out.println("----------------------");
    }
}
