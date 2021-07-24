public class showAccountData {
   @AuraEnabled
    public static List<Account> showAcc(){
        List<Account> acc=[Select id,Name,Industry,Rating from Account];
        return acc;
    }

}