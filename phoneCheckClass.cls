public inherited sharing class phoneCheckClass {
   @AuraEnabled
   public static List<Contact> phoneCheck(String phoneValue){
       List<Contact> conList=[Select FirstName,LastName From Contact where phone =:phoneValue];
       return conList;
   }
}
