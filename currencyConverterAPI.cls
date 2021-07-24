public class currencyConverterAPI {
    public static void currencyconvert(decimal USD){
        Decimal INR=0.0; 
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        
        
        req.setEndpoint('https://free.currconv.com/api/v7/convert?q=USD_INR&apiKey=606fd653317a2a1ce53e');
        req.setMethod('GET');
        
        HTTPResponse res = h.send(req);
        System.debug(res);
        // Map<String,Object> jsonBody = (Map<String, Object>)Json.deserializeUntyped(res.getBody());
        // Map<String,Object> nMap = (Map<String,Object>)jsonBody.get('results');
        // System.debug(jsonBody);
        // Map<String,Object> nMap2 = (Map<String,Object>)nmap.get('USD_INR');
        
        /*Decimal conversionRate=(Decimal)nMap2.get('val');
        INR = USD*conversionRate;
        return INR;*/
    }


}