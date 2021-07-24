public class AccountController {
    @AuraEnabled
    public static List <Account> fetchAccounts() {
        
        List<Account> accList = [SELECT Id, Name, Rating, 
                                    Website, Phone, Industry, Type from Account LIMIT 20];
        
        return accList;
    }

}