public with sharing class getStudentInfo {

    @AuraEnabled
    public static List<Student__c> studentInfo(String className){
    List<Student__c> studentList=[SELECT Id, Roll_Number__c, Name__c, Class__c,Class_Percentage__c,Position__c FROM Student__c 
    WHERE Class__c=:className ORDER BY Roll_Number__c];
    return studentList;
}
@AuraEnabled
public static void positionUpdate(String studentPosition, String studentId){
    String[] stId = studentId.split('-');
    String newId =  stId[0];
    List<Student__c> updateList=[SELECT Id, Roll_Number__c, Name__c, Class__c,Class_Percentage__c,Position__c FROM Student__c 
    WHERE Id =:newId];
    for(Student__c sList:updateList){
        sList.Position__c=studentPosition;
    }
    update updateList;
}
@AuraEnabled
public static List<Student__c> getposition(String studentId){
    String[] stId = studentId.split('-');
    String newId =  stId[0];
    List<Student__c> posList=[SELECT Id, Roll_Number__c, Name__c, Class__c,Class_Percentage__c,Position__c FROM Student__c 
    WHERE Id =:newId];
    return posList;
}
}