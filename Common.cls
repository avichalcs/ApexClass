public class Common {
    public static void commonListElement(){
        
               List<Integer> List1 = new List<Integer>{1,4,7,8};
               List<Integer> List2 = new List<Integer>{2,5,3,6,4,8,9};    
               List<Integer> List3 = new List<Integer>{9,5,2,7,4};
               Set<Integer> Set1=new Set<Integer>(List1);
               Set<Integer> Set2=new Set<Integer>(List2);
               Set<Integer> Set3=new Set<Integer>(List3);
               Set1.retainAll(Set2);
               Set1.retainAll(Set3);
               System.debug(Set1);
               
               
               
    }
}