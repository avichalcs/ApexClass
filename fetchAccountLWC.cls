public with sharing class fetchAccountLWC {
   @AuraEnabled
   public static List<Account> getAccountList(){
       List<Account> accList=[Select id,Name,Website,Phone,Rating from Account Limit 20];
       return accList;
   }
}