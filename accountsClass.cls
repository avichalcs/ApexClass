public class accountsClass {
    @auraEnabled
    public static list<account> getAllAccounts()
    {
       list<account> accs =[select id,name,industry from account limit 10];
      //  list<account> accs =[select id,name,phone,industry from account limit 10];
     //   return [select Id,Name from account limit 10];
     return accs;
    }

}