public with sharing class getContactList {
    @AuraEnabled
    public static List<Contact> getContacts(Id accId){
        List<Contact> conList=[SELECT FirstName, LastName, Phone, Email FROM Contact 
                   Where AccountId=:accId ORDER BY CreatedDate DESC LIMIT 3];
        return conList;
        
    }
    @AuraEnabled
    public static List<Opportunity> getOpp(Id accId){
        List<Opportunity> oppList=[SELECT Name, StageName, Amount, CloseDate, Type FROM Opportunity 
        Where AccountId=:accId ORDER BY CreatedDate DESC LIMIT 3];
        return oppList;
    }
    @AuraEnabled
    public static string updateContacts( Object data,Id accId ) {
        
        List < Contact > accsForUpdate = ( List < Contact > ) JSON.deserialize(
            JSON.serialize( data ),
            List < Contact >.class
        );
        for(Contact con:accsForUpdate){
            con.AccountId=accId;
        }
        try {
            update accsForUpdate;
            return 'Success: Account(s) updated successfully';
        }
        catch (Exception e) {
            return 'The following exception has occurred: ' + e.getMessage();
        }

    }

}