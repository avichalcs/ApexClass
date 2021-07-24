public class commonElement {
    public static void commonElementFinder(){
        
    List<integer> List1 = new List<integer>{1,4,7,8};
    List<integer> List2 = new List<integer>{2,5,3,6,4,8,9};    
    List<integer> List3 = new List<integer>{9,5,2,7,4}; 
    integer i = 0; integer j = 0; integer k = 0; 
        
        List1.sort();
        List2.sort();
        List3.sort();
  
        // Iterate through three arrays while all arrays have elements 
        while (i < List1.size() && j < List2.size() && k<List3.size()) 
        { 
             // If x = y and y = z, print any of them and move ahead 
             // in all arrays 
             if (List1[i] == List2[j] && List2[j] == List3[k]) 
             {   
                 System.debug(List1[i]+'');   
                 i++; 
                 j++; 
                 k++; 
             } 
  
             // x < y 
             else if (List1[i] < List2[j]) 
                 i++; 
  
             // y < z 
             else if (List2[j] < List3[k]) 
                 j++; 
  
             // We reach here when x > y and z < y, i.e., z is smallest 
             else
                 k++; 
        } 
        
        }

}