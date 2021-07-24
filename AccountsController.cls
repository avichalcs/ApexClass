public class AccountsController {
        @AuraEnabled
    public static List <Account> getAccounts() {
        return [SELECT Id, name, Type, Phone FROM Account ORDER BY createdDate ASC];
    }    
    @AuraEnabled
    public static List<Account> findByName(String searchKey) {
        String name =  + searchKey + '%';
        return [SELECT id, name, phone,type FROM Account WHERE name LIKE :name];
    }
    @AuraEnabled
    public static void saveDetails (Account regForm1){ 
    	INSERT regForm1;
    }
    
    @AuraEnabled
    public static Integer countAccount(){ 
    	integer c=[Select count() from Account];
        return c;
    }

}