public with sharing class OrgintegrationController {
    

    public OrgintegrationController() {

    }
    @AuraEnabled
    public static String getContact(String lastName) {
        Connection connection = new Connection();
        ParseJSONService parseJSON = new ParseJSONService();
        return parseJSON.getContactFromJson(connection.integratedOrgCallout(lastName));
    }

    @AuraEnabled
    public static void sendInvitation(String email){
        new MailService().sendInvitation(email);
    }

}
