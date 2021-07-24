public with sharing class insertRecordController  {
 
@AuraEnabled
    public static Id saveAccConOppRecord(List<Account> acc,List<Contact> conList){
        Id AccountId;
       
        system.debug(acc);
        system.debug(conList);
       
       SavePoint sp = Database.setSavePoint();
        try{
            //inserting Account
            insert acc;
           
            //Account a=[SELECT Id FROM Account WHERE CreatedDate=TODAY LIMIT 1 ];
            for(Account a: acc){
               
                AccountId=a.Id;}
           
            //inserting List of Contact associated with Account id
            List<Contact> contactToInsert=new List<Contact>();
            for(Contact con : conList){
                con.AccountId=AccountId;
                contactToInsert.add(con);
            }
            insert contactToInsert;
           
        }
        catch(Exception e){
            Database.rollback(sp);  // if, is there any error occure than transaction would be rolled back to same stage of database.
        }
         return AccountId;
    }
   
   
}