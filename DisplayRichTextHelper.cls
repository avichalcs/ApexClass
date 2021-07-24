public with sharing class DisplayRichTextHelper {
    @AuraEnabled
    public static Attachment generatePDF(String txtValue, Id targetId, String fname){
        
        Pagereference pg = Page.renderAsPDF;
        pg.getParameters().put('displayText', txtValue);
        // Account acc = new Account(Id=targetId);
        Attachment objAttachment = new Attachment();
        objAttachment.Name = fname+'.pdf';
        objAttachment.ParentId = targetId;
        objAttachment.Body = pg.getContentaspdf();   
        objAttachment.IsPrivate = false;
        insert objAttachment;
        return objAttachment;
    }
}