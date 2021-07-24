public class getAllAccounts {
    @AuraEnabled
    public static List <Account> fetchAllAccounts() {
        
        List<Account> accList = [SELECT Id, Name, Rating, 
                                    Website, Phone, Industry, Type from Account ORDER BY CreatedDate desc];
        
        return accList;
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