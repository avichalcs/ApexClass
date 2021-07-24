public with sharing class lwcApexController {
      
    
@AuraEnabled(cacheable=true)
public static List<Account> getCustomLookupAccount (String actName){
   List<Account> accLookupList =  new List<Account>();
   
       String accountName = '%' + actName + '%';
       accLookupList = [Select Id, Name From Account Where Name like:accountName AND Id NOT IN (SELECT AccountId FROM Contact)];
       return accLookupList;
   
}   

}