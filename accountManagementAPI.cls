@RestResource(urlMapping='/AccountManagement/')
global class accountManagementAPI {
    @HTTPPost
    global static String accountCreate(){
        String fieldValue;
        String fieldName;
        String accountName;
        String indus;
        List<String> accList=new List<String>();
        
        
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String JSONBody=req.requestBody.toString();
        
        JSONParser parser =JSON.createParser(JSONBody);
        while (parser.nextToken() != null) {
        if (parser.getCurrentToken() != JSONToken.END_OBJECT)
            {
             parser.nextValue();
             fieldName = parser.getCurrentName();
             fieldValue = parser.getText();
             if(fieldName=='Name')
               {
               accountName=parser.getText();
               accList.add(accountName);
                }
             else if(fieldName=='Industry')
                {
              indus=parser.getText();
              accList.add(indus);
                 }
                System.debug('List Values are '+accList);
                }
        }
             Account acc=new Account(Name=accList.get(0),Industry = accList.get(1));
             insert acc; //insert record in salesforce
            
             return acc.Id; //Return result;
    }

}