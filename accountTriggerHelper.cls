public class accountTriggerHelper {
    public static void methodForCreateOpp(List<Account> accList){
        List<Account> accountListCheck= [Select Id,name,(Select Id from Opportunities)
                                         From Account Where Id IN:accList];
        List<Opportunity> oppList= new List<Opportunity>();
        for(Account acc:accountListCheck){
            if(acc.Opportunities.size()==0){
                Opportunity oppNew= new Opportunity(Name='First Opportunity-'+acc.name,StageName='Prospecting',
                                                    CloseDate=System.today(),AccountId=acc.Id);
                oppList.add(oppNew);
            }
            
        }
        if(oppList.size()>0){
            insert oppList;
        }
    }

}