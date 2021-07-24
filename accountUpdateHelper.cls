public class accountUpdateHelper {
    
    public static void accountUpdate(List<Account> accList){
        List<Account> acQuery= [Select Id,Rating from Account];
        List<Account> updatedList=new List<Account>();
        if(accList[0].Rating=='Warm' && recursiveTriggerHandler.isFirstRun){
             recursiveTriggerHandler.isFirstRun=False;
             for(Account ac: acQuery ){
                 Account accNew=new Account(Id=ac.id,Rating='Warm');
                 updatedList.add(accNew);
                 }
          update updatedList;
            
    }
   }
    public static void accountAutoNumberUpdate(List<Account__c> accList){
        List<Account__c> accAutoNumberUpdate=new List<Account__c>();
        for(Account__c ac:accList){
            Account__c acc=new Account__c(Id=ac.id,Auto_Number_Field__c=ac.Name);
            accAutoNumberUpdate.add(acc);
        }
        update accAutoNumberUpdate;
    }
    
    
    
}