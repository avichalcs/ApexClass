public with sharing class AccountController1 {

    /*
    Method: searchAccount
    Para: Account Name
    here passing the Account Name to Fetching all the releated Accounts
    */
    @AuraEnabled (cacheable = true)
    public static List<Account> searchAccount(String accName) {
        string strAccName = '%'+ accName + '%';
        return [Select Id, Name, Type, Rating, Phone, Website, AnnualRevenue FROM Account WHERE Name LIKE: strAccName ];
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name, Type, Rating, Phone, Website, AnnualRevenue FROM Account 
            ORDER BY Name DESC LIMIT 10];
    }
    

}