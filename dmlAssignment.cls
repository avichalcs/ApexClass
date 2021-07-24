public class dmlAssignment {
    public static void ques1(){
        List<Account> fList=[SELECT name from Account WHERE name like 'u%'];
        Integer i = 1;
        for(Account a : fList){
          a.name=a.name+' Test '+ i;
          i++;
        }
        update fList;
        }
    
     public static void ques2()
     {
      List<Opportunity> opList=new List<Opportunity>();
      List<Account> fList=[SELECT Id, Name FROM Account 
                           WHERE Id NOT IN (SELECT AccountId from Opportunity)];
      for (Account a: fList){
           Opportunity op= new Opportunity(name=a.name+' First Opportunity',StageName='Open',CloseDate=date.Today(),
                                           AccountId=a.id);
           opList.add(op);
      }
      insert opList;
     
     } 
    
    public static void ques3(){
        Account acc = new Account(Name='Avi', numberOfEmployees=1500);
        insert acc;
        Contact con= new Contact(firstname='Anvek',lastname='Mishra',AccountId=acc.id);
        insert con;
        List<Account> accountList = [SELECT Id FROM Account WHERE Id IN(Select Accountid from contact where firstname='Anvek'
                                                                        AND lastname='Mishra')];
        delete accountList;
        List<Account> deletedAccounts = [SELECT name FROM Account WHERE isDeleted=true ALL ROWS];
        undelete deletedAccounts;
        
        
    }
    public static void ques5a(){
        List<Loan__c> ConList1=[SELECT name from Loan__c 
                                  WHERE Loan_Type__c like '_o%' LIMIT 2];
        
        delete ConList1;
        List<Loan__c> ConList2=[SELECT name from Loan__c 
                                  WHERE Loan_Type__c like '_o%' AND isDeleted=true ALL ROWS];
        Database.emptyRecycleBin(ConList2);
        
    }
    
    
    
    
     public static void ques5b(){
        List<User> user1=[SELECT Id, Username, LastName, FirstName, Name FROM User WHERE Username='avi06@cyntexa.com'];
        
        List<Account> accList2=[SELECT ID FROM Account Where LastModifiedById IN: User1 AND 
                                isDeleted=true 
                                AND LastModifiedDate>2020-05-01T00:00:00Z  AND LastModifiedDate<2020-05-18T00:00:00Z ALL ROWS];
        undelete accList2;
                                
        
    }
    public static void ques6(){
         Contact con = new Contact(FirstName='Abhitej');
         con.Email = 'a123@mish.com';

         Account accRef = new Account(SLASerialNumber__c='12');
         con.Account = accRef;

         Account acc = new Account(Name='Avichal', SLASerialNumber__c='12');
         Database.SaveResult[] results = Database.insert(new SObject[] {acc, con});

         for (Integer i = 0; i < results.size(); i++) {
             if (results[i].isSuccess()) {
                 System.debug('Successfully Created ID: '+ results[i].getId());}}
    }
   
    
    public static void ques7(){
        List<Account> acList0=new List<Account>();
        List<Contact> con0=new List<Contact>();
        List<Opportunity> Op=new List<Opportunity>();
        List<OpportunityLineItem> oLi=new List<OpportunityLineItem>();
        Account a1;
        Integer k=0;
        for(integer i=1;i<=5;i++){
            a1=new Account(Name='Sachin'+i);
            acList0.add(a1);            
        }
        Database.saveResult[] l1=Database.insert(acList0,false);
        for (Database.saveResult s:l1){
            if(s.isSuccess()){
                System.debug('SuccessFull'+s.getId());
                Contact c1 = new Contact(firstname='MObNumber',lastname='Avi'+k,accountid=s.id);
                Opportunity op1=new Opportunity(name=' First Opportunity '+k,StageName='Open',CloseDate=date.Today(),accountid=s.id);
                OpportunityLineItem Li=new OpportunityLineItem(TotalPrice=1000+k,Opportunityid=op1.id);
                con0.add(c1);
                Op.add(op1);
                oLi.add(Li); }
            else{
                System.debug('Unsucessfull');
                for(Database.Error er: s.getErrors()){
                    System.debug(er.getStatusCode()+' '+ er.getMessage());
                    System.debug('Fields Affected By Intersion are '+er.getFields());
                }}}
        
        Database.saveResult[] l2=Database.insert(con0,false);
        Database.saveResult[] l3=Database.insert(Op,false);
        Database.saveResult[] l4=Database.insert(oLi,false);
    }
    
    
    public static void ques8(){
       List<Account> Del=new List<Account>();
       List<Account> opLi=[SELECT Id, Name, (SELECT Id from Opportunities) FROM Account];
        integer n;
        for(Account a: opLi){
            n=a.Opportunities.size();
            if(n>2){
                Del.add(a);
            }
        }
        database.delete(del,false);
    }
    
    public static integer ques9(String ob){
        String q='SELECT id FROM '+ ob;
        List<Sobject>obList= dataBase.query(q);
        System.debug(obList.Size());
        return obList.size();
        }
    
    public static void ques10(){
        savepoint sp=Database.setSavepoint();
        List<Account> brList=new List<Account>();
        for(integer i=0;i<80;i++){
            Account br=new Account(Name='Jaipur '+i);
            brList.add(br);
        }
        for(integer i=81;i<=100;i++){
            Account br1=new Account(); //Failed due to Missing Required  Fields
            brList.add(br1);
        }
        Database.SaveResult[] result=Database.insert(brList,false);
        integer k=0;
        for(Database.SaveResult r: result){
            if (r.isSuccess()){
                System.debug('Successful '+r.getId());
                k++;
            }
            System.debug(k);
            
        }
        if(k<90){
            System.debug('Inserted record is less than 80');
            Database.rollback(sp);
        }
    }
    
    }