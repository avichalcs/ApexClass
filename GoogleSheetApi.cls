global class GoogleSheetApi {
   @future(callout=true)
    global static void SendDataToGoogleSheet()
    {
        try{
            List<Contact> conList = [SELECT Id, FirstName, LastName FROM Contact LIMIT 5];
            HttpRequest req = new HttpRequest();
            req.setEndpoint('callout:GoogleSheetAPI/v4/spreadsheets/1A9V74r1Y-w6cRxE2q_GFE3IqTfFeEIA9faxFFfKYrXI/values/Sheet1:append?valueInputOption=RAW');
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/json');
            String body = '';
            for(integer i = 0; i< conList.size(); i++){
                body += '["'+ conList[i].FirstName + '","'+ conList[i].LastName + '"],';
                if(i == conList.size()-1){
                    body = body.removeEnd(',');
                }
            }
            body = '{' + 
                '"majorDimension" : "ROWS",'+
                '"values": ['+ body + '],'+
                '"range": "Sheet1"'+
            '}';
            req.setBody(body);
            Http http = new Http();
            HTTPResponse res = http.send(req);
            if(res.getStatusCode() == 200) {
               	System.debug('SheetAPI Successful : ' + res.getBody());
                delete conList;
            }
            else {
                System.debug('SheetAPI Failed : ' + res.getBody());
            }
        }
        catch(Exception e){
            throw new AuraHandledException('Exception1 : ' + e.getMessage());
        }
    }
}