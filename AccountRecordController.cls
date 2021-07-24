public with sharing class AccountRecordController {
    public AccountRecordController() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> displayAccRecord(){
        List<Account> accList=[SELECT Id, Name FROM Account LIMIT 5];
        return accList;
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> displayContRecord(String accId){
        List<Contact> conList=new List<Contact>();
        for(contact con:[SELECT Id, LastName, Email, Phone, Name, AccountId FROM Contact WHERE AccountId=: accId]) {
            conList.add(con);
        }
        return conList;
    }

}