public class Leader {
    public static void leaderElement(){
    
         List<Integer> List1 = new List<Integer>{149, 1, 3, 248, 2, 90, 70, 5};
             
         Integer lastElement=List1[List1.size()-1]; //last element is always leader
         System.debug(lastElement);
        
         for(integer i=List1.size()-2;i>=0;i--){
            if(lastElement<=List1[i]){
                lastElement=List1[i];
                System.debug(lastElement);
            }
                     }
         
    }                  
    }