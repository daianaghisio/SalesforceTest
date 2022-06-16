@isTest
global with sharing class ParsinJsonDaiMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
            //Se puede hacer un AssertEquals para verificar si req contiene la info que envie yo
            //Ejemplo:
            // System.assertEquals('https://example.com/example/test', req.getEndpoint());

        // Create a fake response.
        // Set response values, and 
        // return response.
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type','application/json');
        res.setBody('{ "color": "random color: #23ABC0", "colorCode": "#23ABC0", "colorDate": "2022-05-26T00:32:59.856Z" }');
        res.setStatusCode(200);
        return res;
    }
}
