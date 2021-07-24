public with sharing class AccountHelper1 {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name, Type, Rating, Phone, Industry, AnnualRevenue FROM Account Where 
        Type!=Null AND  Rating!=Null AND Industry!=Null ORDER BY CreatedDate DESC];
    }
    /*
    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccountNameMethod (String accStrIndustry){
       List<Account> v1 = [SELECT Id, Name, Type, Rating, Phone, Industry, AnnualRevenue FROM Account Where Industry=:accStrIndustry ORDER BY CreatedDate DESC];
       return v1;
     } 
     @AuraEnabled(cacheable=true)
    public static List<Account> searchAccountNameMethod1 (String accStrType){
       List<Account> v2 = [SELECT Id, Name, Type, Rating, Phone, Industry, AnnualRevenue FROM Account Where Type=:accStrType ORDER BY CreatedDate DESC];
       return v2;
     } 
     @AuraEnabled(cacheable=true)
    public static List<Account> searchAccountNameMethod2 (String accStrRating){
       List<Account> v3 = [SELECT Id, Name, Type, Rating, Phone, Industry, AnnualRevenue FROM Account Where Rating=:accStrRating ORDER BY CreatedDate DESC];
       return v3;
     }  */   

}