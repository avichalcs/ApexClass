public class Collections {
    public static void listMethods()
    {
        //List
        
        List<Integer> fList= new List<Integer>{10,15,20,25,55,35,40,45};       //List Initilization
            
        fList.set(2,60);           //set the value on particular index
            
        System.debug(fList);
        
        fList.add(50);                        //Adding new value to the list
        
        System.debug(fList);
        
        System.debug(fList.size());           //Size of the list
        
        System.debug(fList.get(5));           // return the value of 5th index
        
        System.debug(fList.remove(5));        // remove the value of 5th index
        
        fList.sort();
        
        System.debug(fList);                 //sort the value in ascending order
        
        System.debug(fList.isEmpty());       // return boolean value True if list is empty otherwise False
         
        List<Integer> sList= fList.clone();  // copy all the value of the fList and make another list
        
        System.debug(sList);
        
        sList.clear();                       //clear all values of s list
        
        System.debug(sList);
        
        }
    public static void setMethods()
    {
        Set<String> fSet=new Set<String>{'Avichal','Sachin','Abhitej','Satyam'};     //set Initilization
          
        System.debug(fSet);                  
        
        fSet.add('Anvek');                               //Adding new value to the set   
        
        System.debug(fSet);
        
        System.debug(fSet.contains('Abhitej'));         // return True if set contains the string
        
        List<String> List1= new List<String>{'Avichal','Sachin','Satyam'};    //new list of string
        
        System.debug(fSet.containsall(List1));         //return True if set contains all list values
        
        System.debug(fSet.size());                    // size of the set
        
        fSet.remove('Satyam');                        // remove string from the set
        
        System.debug(fSet);
        
        fSet.retainAll(List1);
        
        System.debug(fSet);                 // retain the available element in the list & removes the rest elements.
        
        Set<String> sSet=fSet.clone();     //make a copy of fSet
        
        System.debug(sSet);
        
        sSet.clear();                      // clear the set
        
        System.debug(sSet);
        
    }
    
    public static void mapMethods()
    {
        Map<Integer,String> fMap= new Map<Integer,String>{1=>'Avichal',2=>'Abhitej',3=>'Ashish',4=>'Harshit'};
                                           //initilization of map
        System.debug(fMap);
        
        fMap.put(5,'Nausher');             //adding new value to the map
        
        System.debug(fMap);
        
        System.debug(fMap.get(2));        //get the value associated with the key
        
        List<String> List3=new List<String>();
        
        List3=fMap.values();             // return all values of map into a string
        
        System.debug(List3);
        
        System.debug(fMap.keySet());    // return keys of the map
        
        System.debug(fMap.containsKey(6)); //return True if map contains the key
        
        System.debug(fMap.isEmpty());    //return True if map is Empty
        
        System.debug(fMap.size());       //return size of the map
        
        fMap.remove(3);                  //remove the specified key pair
        
        System.debug(fMap);
        
        fMap.clear();                    //clear the map
        
        System.debug(fMap);
            
    }

}