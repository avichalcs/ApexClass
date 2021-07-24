public class accountQuery {
    /*public static void accountQ(){
    List<Account__c> accList=[Select Account_Holder_Name__c,Branch__r.Branch_Name__c,Branch__r.Bank__r.Bank_Name__c
                              ,(Select name from Transactions__r) from Account__c];
        for(Account__c a:accList){
            System.debug(a);
        }*/
        
        
        public static List<Account> searchAccountNameMethod (String accStrIndustry){
               
       List<Account> v1 = [SELECT Id, Name, Type, Rating, Phone, Website, AnnualRevenue FROM Account Where Industry=:accStrIndustry ORDER BY CreatedDate DESC];
       return v1;
     }    

        
}