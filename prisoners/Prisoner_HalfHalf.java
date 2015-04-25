import java.util.Scanner;

public class Prisoner_Halfhalf {
  
   public static void main(String[] args) {
      Scanner scanner = new Scanner(System.in);
      int numRounds = scanner.nextInt();
      //Starting move
      System.out.println("D");
     
     
      for (int i = 1; i < numRounds; i++) {
        String prevMove = scanner.next();
        oppHistory.add(prevMove);
        System.out.println( (i < numRounds/2) ? "C": "D");
      }
      scanner.close();
   }
}

