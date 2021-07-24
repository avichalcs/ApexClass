public class removeDuplicates {
     public static void removeDuplicateMethod(){  
         List<List<string>> inputList= new List<List<string>>{
             
            new List<String>{'a;b;a;v;c', 'x;x;y;c;q'},
            new List<String>{'m;b;h;j;m', 'u;k;j;u'}
         };
        List<List<string>> outputList=new List<List<string>>();            // creating a list,which contains the output list
       
        for(Integer i=0;i<inputList.size();i++){
            Set<string> tempSet=new Set<String>();        // creating a set,which remove duplicate elements from  sub list.
           
            tempSet.addAll(inputList.get(i));       // getting ith index element from inputList,and passing it to set.
            
         
           
            List<string> tempList=new List<String>(tempSet);         // converting set to List,by creating a tempraory list.
           
            tempList.sort();                                       // sorting list elements.
           
            outputList.add(tempList);                             // Adding sorted tempList to output List.
                       
        }
        // Showing the final output list,which does not contain any duplicates.
        system.debug('After removing duplicate values from list , List :'+outputList);
    }

}