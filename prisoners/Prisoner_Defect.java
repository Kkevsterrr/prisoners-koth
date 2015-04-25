import java.util.Scanner;

public class Prisoner_Defect {
   public static void main(String[] args) {
      Scanner scanner = new Scanner(System.in);
      int numRounds = scanner.nextInt();
      System.out.println("D");
      for (int i = 1; i < numRounds; i++) {
         String prevMove = scanner.next();
         System.out.println("D");
      }
      scanner.close();
   }
}

