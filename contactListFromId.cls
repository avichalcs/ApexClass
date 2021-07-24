public with sharing class contactListFromId {
    @AuraEnabled
    public static List<Contact> getContactList(id accId){
        List<Contact> conList=[Select id,FirstName,LastName,Phone,Email From Contact where AccountId=:accId];
        return conList;
    }
}