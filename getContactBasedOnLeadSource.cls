public with sharing class getContactBasedOnLeadSource {
    @AuraEnabled(cacheable=true)  
    public static List<Contact> findContacts(String leadS) {
        List<Contact> conList=[SELECT Id, Name, Phone, Email, LeadSource FROM Contact where LeadSource=:leadS ];
        return conList;
     
    }  
    @AuraEnabled()  
    public static List<Contact> attachContacts(List<Id> conId,Id accId) {
      List<Contact> conList=[Select id,FirstName, LastName, Phone, Email, LeadSource from Contact where id IN:conId];
     for (Contact con:conList){
         con.AccountId=accId;
     }
     update conList;
     return conList;
     
    }
}