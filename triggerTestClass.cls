@isTest
public class triggerTestClass {
    @isTest
    public static void q1Test(){
        List<Account> accList=new List<Account>();
        
        for(integer i=0;i<=5;i++){
        Account acc= new Account(Name='AviTest'+i);
        accList.add(acc);
        }
        insert accList;
        List<Account> newAccList=[Select Name,(Select name from opportunities) from Account];
        for(Account ac: newAccList){
            System.debug(ac);
        }
    }
    @isTest
    public static void q2Test(){
        Account accTest=new Account(Name='AviTest0');
        insert accTest;
        
        Opportunity opp=new Opportunity(Name='AviTestOpp1',CloseDate=System.TODAY(),StageName='Prospecting',
                                        AccountId=accTest.id);
        Opportunity opp1=new Opportunity(Name='AviTestOpp1',CloseDate=System.TODAY(),StageName='Prospecting',
                                        AccountId=accTest.id);

        
        insert opp;
        insert opp1;
        
        List<Opportunity> testCheckList=[Select Account.Name,name from opportunity];
        System.debug(testCheckList);
        
    }
    @isTest
    public static void q3Test(){
        Account accTest1=new Account(Name='AviTest1');
        insert accTest1;
         Account accTest2=new Account(Name='AviTest2');
        insert accTest2;
        List<Account>accList=[Select name from account];
        Account a=accList[0];
        Account b=accList[1];
        merge a b;
        
    }
    @isTest
    public static void q4Test(){
        Account accTest=new Account(Name='AviTest1');
        insert accTest;
        Opportunity opp=new Opportunity(Name='AviTestOpp1',CloseDate=System.TODAY(),StageName='Prospecting',
                                        AccountId=accTest.id);
        insert opp;
        delete accTest;
        List<Account> newAccList=[Select Name,(Select name from opportunities) from Account];
        for(Account ac: newAccList){
            System.debug(ac);
        }
        
        }
    @isTest
    public static void q5Test(){
        Account accTest=new Account(Name='AviTest1');
        insert accTest;
        List<Id> accID=new List<Id>();
        List<Opportunity> oppTestList=new List<Opportunity>();
        Opportunity opp=new Opportunity(Name='AviTestOpp1',CloseDate=System.TODAY(),StageName='Prospecting',
                                      Amount=15000,  AccountId=accTest.id);
        Opportunity opp1=new Opportunity(Name='AviTestOpp2',CloseDate=System.TODAY(),StageName='Prospecting',
                                      Amount=5000,  AccountId=accTest.id);
        oppTestList.add(opp);
        oppTestList.add(opp1);
        insert oppTestList;
        for(opportunity op:oppTestList){
        if(opp.Amount>10000){
            accId.add(op.AccountId);
            }
        List<Account> accList=[Select Name,CustomerPriority__c,Rating From Account Where Id IN:accId];
        List<Account> accUpdate=New List<Account>();
        if(!accId.isEmpty()){
            for(Account ac: accList){
                ac.Rating='Hot';
                ac.CustomerPriority__c='Hot';
                accUpdate.add(ac);
            }
            if(!accUpdate.isEmpty()){
                Update accUpdate;
            }
            }
        }
       }
    
     @isTest
     public static void q6Test(){
         Lead lTest1=new Lead(FirstName='Avichal',LastName='Mishra',LeadSource='Phone Inquiry',Company='Cyntexa');
         Lead lTest2=new lead(FirstName='Sachin',LastName='Sharma',LeadSource='Web',Company='Cyntexa');
         insert lTest1;
         insert lTest2;   
        }
    @isTest
    public static void q7Test(){
        Account accTest=new Account(Name='AviTest0');
        insert accTest;
        
        Opportunity opp=new Opportunity(Name='AviTestOpp1',CloseDate=System.TODAY(),StageName='Prospecting',
                                        AccountId=accTest.id);
        insert opp;
        Opportunity opp1=new Opportunity(Name='AviTestOpp1',CloseDate=System.TODAY(),StageName='Proposal/Price Quote',
                                        Id=opp.id);
       update opp1;
    }
     @isTest
    public static void q8Test(){
        Account accTest=new Account(Name='AviTest0');
        insert accTest;
        
        Opportunity opp=new Opportunity(Name='AviTestOpp1',CloseDate=System.TODAY(),StageName='Prospecting',
                                        AccountId=accTest.id);
        insert opp;
        Task tTest=new Task(whatid=opp.id);
        insert tTest;
        Opportunity opp1=new Opportunity(Name='AviTestOpp1',CloseDate=System.TODAY(),StageName='Proposal/Price Quote',
                                       Id=opp.id);
        if(opp1.StageName=='Closed Won' || opp.StageName=='Closed Won')
               update opp1;
        
    }
     @isTest
    public static void q9Test(){
        Account accTest=new Account(Name='AviTest0');
        insert accTest;
        List<Opportunity> newOppTest=new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
        Opportunity opp=new Opportunity(Name='AviTestOpp1 '+i,CloseDate=System.TODAY(),StageName='Prospecting',
                                        AccountId=accTest.id);
            newOppTest.add(opp);
        }
        insert(newOppTest);
    }
    @isTest
    public static void q10Test(){
        Account accTest=new Account(Name='AviTest0');
        insert accTest;
        
        Opportunity opp=new Opportunity(Name='AviTestOpp1',CloseDate=System.TODAY(),StageName='Prospecting',
                                        AccountId=accTest.id);
        insert opp;
        
        Product2 pr = new Product2(Name='Moto - G1',isActive=true);
        insert pr;
        
        PriceBook2 customPriceBook = new PriceBook2(Name='Custom Pricebook',IsActive=true);

        insert customPriceBook;
        
        // Query Std & Custom Price Books
       Pricebook2 customPriceBookRec=[select Id from Pricebook2 where id=:customPriceBook.Id];
       Id stdPriceBookRecId = System.Test.getStandardPricebookId();
        
        // Create Standard PriceBookEntry
      PriceBookEntry stdPriceBookEntry = new PriceBookEntry(Product2Id=pr.Id,Pricebook2Id=stdPriceBookRecId,
                                                            UnitPrice=2000,IsActive=true);

      insert stdPriceBookEntry;

       // Create Custom PriceBookEntry 
       PriceBookEntry customPriceBookEntry = new PriceBookEntry(Product2Id=pr.Id,Pricebook2Id=customPriceBookRec.Id,
                                                              UnitPrice=5000,IsActive=true);
       insert customPriceBookEntry;
        
        OpportunityLineItem oppLineItem = new OpportunityLineItem(OpportunityId = opp.Id,
                                            PricebookEntryId = customPriceBookEntry.Id,UnitPrice = 15000,Quantity = 5 );
        if(oppLineItem.UnitPrice>10000)
        insert oppLineItem;
        
    }

}