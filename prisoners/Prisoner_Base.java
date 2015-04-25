import java.util.Scanner;

public class Prisoner_Base {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int numRounds = scanner.nextInt();
        // Maybe set up some datastructures
        System.out.println("first_move");  // Should be "C" or "D"
        for (int i = 1; i < numRounds; i++) {
            String prevMove = scanner.next();  // how your opponent played last round
            // Maybe do some logic
            System.out.println("another_move");  // Should be "C" or "D"
        }
        scanner.close();
    }

}

