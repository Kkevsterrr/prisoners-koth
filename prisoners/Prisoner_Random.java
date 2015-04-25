import java.util.Scanner;

public class Prisoner_Random 

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int numRounds = scanner.nextInt();
        System.out.println(Math.random() < 0.5 ? "C" : "D");
        for (int i = 1; i < numRounds; i++) {
            String prevMove = scanner.next();
            System.out.println(Math.random() < 0.5 ? "C" : "D");
        }
        scanner.close();
    }

}

