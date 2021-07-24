public class contactListController {
    @AuraEnabled
    public static List<Contact> getContactList(){
        List<Contact> contactList= [SELECT Id, LastName, FirstName, Name, Phone, Email FROM Contact];
        return contactList;
        
    } 

}