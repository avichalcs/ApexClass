public class ques2TriggerHelper{
    public static void methodForCheckOpp(List<Opportunity> oppList){
        Set<Id>accId=new Set<Id>();
        List<String>oppName=new List<String>();
        for (Opportunity a:oppList){
            accId.add(a.AccountId);
            oppName.add(a.Name);
        }
        List<Opportunity> oppListCheck= [Select Id,Name,AccountId From Opportunity Where Name IN:oppName 
                                         AND AccountID IN: accId];
        for(Opportunity op:oppListCheck){
            for(Opportunity op1:oppList){
                if(op.AccountId==op1.AccountId && op.Name==op1.name)
                    op1.Name=Op1.Name+' Duplicate Opportunity';
                
            }}}
    public static void q3backupAccount(List<Account> accList){
        List<Account_Backup__c> listAccBackup = new List<Account_Backup__c>();
        for(Account ac: accList){
            if(ac.MasterRecordId != Null){
                Account_Backup__c acBackup=new Account_Backup__c();
                 acBackup.Name__c = ac.Name; 
                 acBackup.Phone__c = ac.Phone; 
                 listAccBackup.add(acBackup);
            }
            
        }
        insert listAccBackup;
    }
    
    
    
    
    
    public static void q4PreventDelete(List<Account> accList){
        List<Account> checkList=[Select Id,name,(Select Id,StageName from Opportunities where 
                                                 StageName!='Closed Won' AND StageName!='Closed Lost')
                                         From Account Where Id IN:accList];

            for(Account ac1:checkList){
                if(ac1.Opportunities.size()!=0){
                    ac1.addError('you can not delete this account,Opportunies are associated with it');
                }
            }
    }
    
    public static void q5OppAmount(List<Opportunity> opList){
       List<Id> accId=new List<Id>();
        
        for(Opportunity op: opList){
            if(op.Amount>1000){
                accId.add(op.AccountId);
                }
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
    
    
    
    
    
    
    public static void q6LeadConvertTrigger(List<Lead> leadList){
        List<Database.leadConvert> leadConverts=new List<Database.leadConvert>();
        
        
        for(Lead cL : leadList){
            if(cL.LeadSource=='Phone Inquiry')
            {
            Database.leadConvert lc=new Database.LeadConvert();
            lc.setLeadId(cL.id);
            lc.convertedstatus='Closed - Converted';
            leadConverts.add(lc);
            }
        }
        if (!leadConverts.isEmpty()) {
            List<Database.LeadConvertResult> lcr = Database.convertLead(leadConverts);
        }
        
}
    public static void Q7opportunityUpdate(List<Opportunity> oppList){
        List<Opportunity> newList=new List<Opportunity>();
        for(Opportunity o: oppList){
            Opportunity backup=o.clone(false);
            backup.Name=o.name+' Backup';
            newList.add(backup);
        }
        insert newList;
    }
    public static void q8ValidateOppStageMethod (List<Opportunity> OppNew, List<Opportunity> OppOld) {
		
		Map<Id, Integer> OppTaskCount = new map<Id, Integer>();
		List<AggregateResult> ARList = [select WhatId, Count(Id) TaskCount from Task where WhatId IN:OppNew 
                                        group by whatId];

		for(AggregateResult AR : ARList) {
		  OppTaskCount.put((Id)AR.get('WhatId'), Integer.valueOf(AR.get('TaskCount')));
		}

		for(Opportunity Opp : OppNew) {
		   if(Opp.StageName != 'Closed Won' && Opp.StageName != 'Closed Lost' ) {
			   if(!OppTaskCount.containsKey(Opp.Id)) {
					 Opp.addError('Stage cannot be changed with a task on Opportunity');
			   }
		   }
		}		
		
	}
    
    
   
    
    public static void q9StopUserTrigger(List<Opportunity> oppList){
        
       /* AggregateResult[] ArList=[Select OwnerId,Count(Id) FROM Opportunity Where Id IN: oppList
                                   AND StageName!='Closed Won' AND StageName!='Closed Lost' GROUP By OwnerId];
       for(AggregateResult r: ArList){}
           */
        List<Opportunity> opp=[Select id from Opportunity where ownerId =: Userinfo.getUserId() AND 
                             StageName!='Closed Won' AND StageName!='Closed Lost'];
        if(opp.size()>2){
            oppList[0].addError('You can not create opportunity because you exceeds the maximum limit');
        }

            
        }
    public static void q10OpportunityProductPrice(List<OpportunityLineItem> oppProductList){
        
        Set<Id> productId=new Set<id>();
        for(OpportunityLineItem pId:OppProductList){
            productId.add(pId.Product2Id);
            
        } 
        List<Product2> newProductList=[Select Name,Description From Product2 
                                                     where Id IN: productId];
        for(OpportunityLineItem o:OppProductList){
            if(o.UnitPrice<10000){
                o.addError('Product Can not be inserted. Amount should be greater than 10000');
                
            }
            for(Product2 p:newProductList){
                if(o.Product2Id==p.id){
                    o.description=p.description;
                }
            }
                
        }
        
        
    }
                
            
}