public class soqlQueries {
    public static void Query(){
   
    List<Account> accList=[SELECT name from Account];      //Select 
        System.debug(accList);
        
    List<Bank__c> bankList=[SELECT Bank_Name__c from Bank__c WHERE Sector__c='Public'];  //Where
        System.debug(bankList);
    
    List<Bank__c> bankList1=[SELECT Bank_Name__c from Bank__c WHERE Sector__c='Public' 
                                     AND Type_Of_Bank__c='International'];               // And
        System.debug(bankList);
        
    // Aggregate Functions
    
     AggregateResult aR1=[SELECT SUM(Total_Balance__c) FROM Account__c 
                                    WHERE Account_Type__c='Saving Bank Account'];       //Sum
        System.debug(aR1);
        
        
     AggregateResult aR2=[SELECT MAX(Total_Balance__c) FROM Account__c 
                                    WHERE Account_Type__c='Saving Bank Account'];       //Max
        System.debug(aR2);
        
     AggregateResult aR3=[SELECT MIN(Total_Balance__c) FROM Account__c 
                                    WHERE Account_Type__c='Saving Bank Account'];       //Min
        System.debug(aR3);
        
     AggregateResult aR4=[SELECT AVG(Total_Balance__c) FROM Account__c 
                                    WHERE Account_Type__c='Current Bank Account'];       //Avg
        System.debug(aR4);
        
     
     AggregateResult aR5=[SELECT COUNT_DISTINCT(Account_Holder_Name__c) FROM Account__c 
                                    WHERE Account_Type__c='Current Bank Account'];       //Count Distinct
        System.debug(aR5); 
        
     //Imp
     AggregateResult aR6=[SELECT COUNT(Name) FROM Account__c];                     //Count(field name)
        System.debug(aR6); 
     
     Integer c= [SELECT COUNT() FROM Account__c];                                      //Count()
        System.debug(c);
        
        
        
    //Soql keywords
        List<String>accType=new List<String>{'Saving Bank Account','Current Bank Account'};
        List<Account__c> List0=[SELECT Account_Holder_Name__c FROM Account__c 
                                              WHERE Account_Holder_Name__c IN :accType ];       // IN
        System.debug(List0);
        
        List<Account__c> List1=[SELECT Account_Holder_Name__c FROM Account__c 
                                              WHERE Account_Holder_Name__c NOT IN :accType ];       // NOT
        System.debug(List1);
        
        
        
        List<Account__c> List2=[SELECT Account_Holder_Name__c FROM Account__c 
                                              WHERE Account_Holder_Name__c LIKE 'Avi%'];          // Like & %
        System.debug(List2); 
        
        
        List<Account__c> List3=[SELECT Account_Holder_Name__c FROM Account__c 
                                              WHERE Account_Holder_Name__c LIKE 'Avi%' AND 
                               Account_Type__c='Saving Bank Account'];                           // AND OR
        System.debug(List3);
        
     
        List<Account__c> List4=[SELECT Account_Holder_Name__c FROM Account__c WHERE Account_Type__c
                                ='Saving Bank Account'  ORDER BY Account_Holder_Name__c ASC];      // ORDER BY
        System.debug(List4);
        
        AggregateResult aR7=[SELECT COUNT(Account_Holder_Name__c) FROM Account__c 
                                              GROUP BY Account_Type__c];                          // GROUP BY
        System.debug(aR7);
        
        
         List<Account__c> List5=[SELECT Account_Holder_Name__c FROM Account__c WHERE Account_Type__c
                                ='Saving Bank Account'  LIMIT 5];                                // LIMIT
         System.debug(List5);
        
        
         List<Account__c> List6=[SELECT Account_Holder_Name__c FROM Account__c WHERE Account_Type__c
                                ='Saving Bank Account' FOR UPDATE];                             // FOR UPDATE
        System.debug(List6);
        
        
        
     
        
    }
}