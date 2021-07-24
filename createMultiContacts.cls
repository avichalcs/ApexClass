public with sharing class createMultiContacts {
    @AuraEnabled
    public static void createContact(List<Contact> contactList,Id accId){
        for(Contact con:contactList){
            con.AccountId=accId;
        }

        insert contactList;
    }
    @AuraEnabled
    public static void createOpp(List<Opportunity> oppList,Id accId){
        for(Opportunity opp:oppList){
            opp.AccountId=accId;
        }

        insert oppList;
    }
}