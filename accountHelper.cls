public class accountHelper {
    public static void checkRating(List<Account> newList, Map<Id,Account> accOldMap){
        for(Account acc: newList){
            Account oldAccount = accOldMap.get(acc.ID);
            if(acc.Rating=='Warm' && oldAccount.Rating=='Hot'){
                acc.AnnualRevenue=25000;
            }
            
        }
    }

}