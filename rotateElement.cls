public class rotateElement {
    public static void rotateLeft(){
                                                                              
            List<integer> List1 = new List<integer>{2,5,3,6,4,8,9};       //Initialize list 
                
                      
            integer n = 1;                         //n determine the number of times an array should be rotated.

                  
                
            //Rotate the given array by n times toward right    
            for(integer i = 0; i < n; i++){    
                integer j, first;    
                //Stores the first element of array    
                first = List1[0];    
                
                for(j=0; j<List1.size()-1; j++){    
                    //Shift element of array by one    
                    List1[j] = List1[j+1];    
                }    
                //First element of array will be added to the end of array.    
                List1[j] = first;    
            }    
            
            System.debug(List1);    
                
            
        }    
    
    
   public static void rotateRight(){
                                                                              
            List<integer> List1 = new List<integer>{2,5,3,6,4,8,9};       //Initialize list 
                
                      
            integer n = 1;                         //n determine the number of times an array should be rotated.

                
            //Rotate the given array by n times toward right    
            for(integer i = 0; i < n; i++){    
                integer j, last;    
                //Stores the last element of array    
                last = List1[List1.size()-1];    
                
                for(j = List1.size()-1; j > 0; j--){    
                    //Shift element of array by one    
                    List1[j] = List1[j-1];    
                }    
                //Last element of array will be added to the start of array.    
                List1[0] = last;    
            }    
            
            System.debug('');    
                
            //Displays resulting array after rotation    
            System.debug('Array after right rotation: ');    
            for(integer i = 0; i< List1.size(); i++){    
                System.debug(List1[i] + ' ');    
            }    
        }  

}