import java.util.Scanner;

public class Prisoner_CoopSelf {
   public ArrayList<String> oppHistory = new ArrayList<String>();
   public boolean isMe = false;
  
   public static void main(String[] args) {
      Scanner scanner = new Scanner(System.in);
      int numRounds = scanner.nextInt();
      //Starting move
      System.out.println("D");
     
     
      for (int i = 1; i < numRounds; i++) {
        String prevMove = scanner.next();
        oppHistory.add(prevMove);
        if (isPrime(i - 1)) {
          isMe = prevMove.equals("C");
        }
        if (i < 15) {
            System.out.println( (iPrime(i) ? "C": "D");
        } else { 
            System.out.println( (isMe) ? "C" : "D");
        }
      }
      scanner.close();
   }
}

//Credit to Tareq Salaheldeen
private static boolean isPrime(int num) {
        if (num % 2 == 0) return false;
        for (int i = 3; i * i <= num; i += 2)
            if (num % i == 0) return false;
        return true;
}
