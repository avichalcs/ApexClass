public with sharing class contactOliver {
    @AuraEnabled(cacheable=true)
    public static List<Contact> contactList() {
        return [SELECT Id, FirstName, LastName, Phone, Email,Poistion__c FROM Contact];

    }
}