public class Duplicates {
    public static void removeDuplicates(){  
         List<List<string>> inputList= new List<List<string>>{
             
            new List<String>{'a;a;a;a;a', 'b;b;b;b;b'},
            new List<String>{'c;c;c;c;c', 'd;d;d;d'}
         };
        List<string> tempList=new List<String>();
        List<string> tempList1=new List<String>();
        List<string> tempList2=new List<String>();
        List<string> tempList3=new List<String>();
        Set<String> tempSet=new Set<String>();
        String nString='';
        for(Integer i=0;i<inputList.size();i++){
              tempList.addAll(inputList.get(i));                                   
                       
        }
        
        for(string i:tempList){
            String a=i.remove(';');
            tempList1.add(a);
            for(string j: tempList1){
                tempList2=j.split('');
                templist2.sort();
                tempSet.addAll(tempList2);
                
            }
            for(string j:tempset){
                nString=nString+j+';';        
            }
            tempList3.add(nString);
            tempSet.clear();
            tempList1.clear();
            tempList2.clear();
            nString='';
            
            
           
        }
        
        System.debug(tempList3);
       
      
    }

}