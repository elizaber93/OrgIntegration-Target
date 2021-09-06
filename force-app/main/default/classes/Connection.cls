public with sharing class Connection {

    /*
    private  String url = 'https://test.salesforce.com/services/oauth2/token';
    private static String stdUserName = 'test-uari14ijse9u%40example.com';
    private static String stdPassword = '2o9%40qcwPNO%257n';
    private static String stdGrantType = 'password';
    private static String stdClientId = '3MVG9z6NAroNkeMmZAp0da9vGUP4V710W0PllEsVnCoa5zxv3kuVbDZm8N2gHzqFBfYIAsRcv_enD8WSsGpPT';
    private static String stdClientSecret = '7E0DB23055E6A2B5C544672EB03A594751D40CF056D40A1B0B6322FB5E15051F';
    private static String stdredirectUri = 'https%3A%2F%2Fability-velocity-9686-dev-ed.salesforce.com%2FoAuth2%2Fcallback';
    
    private String userName;
    private String password;
    private String grantType;
    private String clientId;
    private String clientSecret;
    private String redirectUri;

    private String jsonRequestBody;

    public Connection() {
         this(stdUserName, stdPassword, stdGrantType, stdClientId, stdClientSecret, stdredirectUri);
    }

    public Connection(String userName, String password, String grantType, String clientId, string clientSecret, String redirectUri) {
        this.clientId = clientId;
        this.clientSecret = clientSecret;
        this.grantType = grantType;
        this.password = password;
        this.userName = userName;
        this.redirectUri = redirectUri;
    }

    public String generateAccessTokenInstanceURL() {
        
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setHeader('Content-Type','application/x-www-form-urlencoded'); 
        req.setHeader('Accept', 'application/json');
        req.setEndpoint('https://test.salesforce.com/services/oauth2/token?username=test-uari14ijse9u%40example.com&password=2o9%40qcwPNO%257n&grant_type=password&client_id=3MVG9z6NAroNkeMmZAp0da9vGUP4V710W0PllEsVnCoa5zxv3kuVbDZm8N2gHzqFBfYIAsRcv_enD8WSsGpPT&client_secret=7E0DB23055E6A2B5C544672EB03A594751D40CF056D40A1B0B6322FB5E15051F&redirect_uri=https%3A%2F%2Fability-velocity-9686-dev-ed.salesforce.com%2FoAuth2%2Fcallback');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        return res.getBody();
        
    }

        public static HttpRequest httpRequestGenerator(String reqMethod, String endpoint, String accessToken) {
            String authorizationHeader = 'Bearer ' + accessToken;
            HttpRequest httpRequest = new HttpRequest();
            httpRequest.setMethod(reqMethod);
            httpRequest.setEndpoint(endpoint);
            httpRequest.setHeader('Authorization', authorizationHeader);
            httpRequest.setHeader('Content-Type', 'application/json;charset=UTF-8');
            return httpRequest;
            }

            public void loginToApp() {
                String oAuthResponse = generateAccessTokenInstanceURL();
                Map<String, Object> m = (Map<String, Object> ) JSON.deserializeUntyped(oAuthResponse);
                
                
                String InstanceURL = String.valueOf(m.get('instance_url'));
                String accessToken = String.valueOf(m.get('access_token'));
                String domainUrl=System.URL.getSalesforceBaseUrl().toExternalForm();
                system.debug('********domainUrl:'+domainUrl);
                
                
                // Generate endPointURL and send request to retrieve data
                String endPointURL = instanceURL + '/services/apexrest/contact/young';
                Http http = new Http();
                HttpRequest httpRequest = httpRequestGenerator('GET', endPointURL, accessToken);
                HTTPResponse httpResponse = http.send(httpRequest);
                String response = httpResponse.getBody();
                system.debug('httpResponse.getBody() ->' + httpResponse.getBody());
                
                
                }
            */
            public String integratedOrgCallout(String lastName) {
                Http http = new Http();
                HttpRequest request = new HttpRequest();
                request.setHeader('Content-Type', 'application/json;charset=UTF-8');
                request.setEndPoint('callout:OrgIntegration/services/apexrest/contact/'+lastName);
                request.setMethod('GET');
                HttpResponse response = http.send(request);
                String body = response.getBody();
                return body;
            }

            
}
