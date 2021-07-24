@isTest
public class testSetupMethod {
   
 @testSetup 
    static void testSetup() {
        
        List<Account> testAccts = new List<Account>();
        for(Integer i=0;i<2;i++) {
            testAccts.add(new Account(Name = 'TestAcct'+i));
        }
        insert testAccts;        
    }
    
    @isTest 
        static void testMethod1() {
       
        Account acct = [SELECT Id FROM Account WHERE Name='TestAcct0' LIMIT 1];
        
        acct.Phone = '985487';
       
        update acct;
        
        
        Account acct2 = [SELECT Id FROM Account WHERE Name='TestAcct1' LIMIT 1];

        delete acct2;
        
        
    }

}