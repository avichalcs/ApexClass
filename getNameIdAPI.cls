@RestResource(urlMapping='/NameIdGet/')
global class getNameIdAPI {
    @HTTPGet
    global static String GetNameID(){
        String objName;
        Id i;
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        objName= req.headers.get('ObjectName');
        i= req.headers.get('Id');
        
        String qr= 'Select Name from '+objName+' where id = :i ' + 'Limit 1';
        sObject s=database.query(qr);
        
        String JsonResponse= '{\"Name\":\"'+s.get('Name')+'\"}';
        return JsonResponse;
        
    }

}