public with sharing class MailService {
    private static String INVITATION_TEMPLATE = 'OrgIntegrationTemplate';

    public MailService() {

    }

    public void sendInvitation(String email) {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        EmailTemplate template = [SELECT Id FROM EmailTemplate WHERE Name = :INVITATION_TEMPLATE];    
        message.setToAddresses(new List<String>{email});
        message.setTemplateId(template.Id);
        message.setTargetObjectId(UserInfo.getUserId());
        message.setSaveAsActivity(false);   
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {message});
    
    }      
}
