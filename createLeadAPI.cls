@RestResource(urlMapping='/LeadCreate/')
global class createLeadAPI {
    @HTTPPost
    global static String doPost(){
String fieldValue;
String fieldName;
String FName;
String LName;
String Comp;
String str ='Task Completed';
List<String> LeadList=new String[3];
        
RestRequest req = RestContext.request;
RestResponse res = RestContext.response;

// Apex REST Methods
System.debug('Param is '+req.params);
System.debug('Body is '+req.requestBody);
String arr=req.requestBody.toString();

//Json-parser is used to get schema of content i:e what is the actual content//
JSONParser parser =JSON.createParser(arr);
while (parser.nextToken() != null) {
if (parser.getCurrentToken() != JSONToken.END_OBJECT)
{
parser.nextValue();
fieldName = parser.getCurrentName();
fieldValue = parser.getText();
if(fieldName=='First Name')
{
FName=parser.getText();
LeadList.add(1,FName);
}
else if(fieldName=='Last Name')
{
LName=parser.getText();
LeadList.add(2,LName);
}
else if(fieldName=='Company')
{
Comp=parser.getText();
LeadList.add(3,Comp);
}
System.debug('List Values are '+LeadList);
}
}
//Create a lead object with appropriate data
Lead lc=new Lead(FirstName=LeadList.get(1),LastName = LeadList.get(2),Company
= LeadList.get(3));
insert lc; //insert record in salesforce
String leadId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
return str; //Return result;
}

}