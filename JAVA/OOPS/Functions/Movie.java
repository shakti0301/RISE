package OOPS.Functions;

public class Movie {

    /* Movie ticket booking
    A movie ticket system where we can select the seats, calculate the bill and display the booking details.
    1st method constructor -  define how many seats available, price per seats.
    2 methods
    1. calculate method
    2. display method


     */

    String MovieName;
    int Seats;
    int PricePerSeats;

    public Movie (String MovieName, int Seats){
        this.MovieName = MovieName;
        this.Seats = Seats;
        this.PricePerSeats = 200;
    }


    public double CalculateBill(){
         return Seats * PricePerSeats;
    }

    public void display(){
        System.out.println("Movie Name: " + MovieName);
        System.out.println("Total booked tickets: " + Seats);
        System.out.println("Bill: " + CalculateBill());
        System.out.println("----------------------");
    }

}
