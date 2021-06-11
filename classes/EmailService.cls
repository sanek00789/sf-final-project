public class EmailService {
    
    public static void sendEmail (List<Email__mdt> emails, String textEmail) {
    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>(); 
        
        for (Email__mdt email : emails) {            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(email.Email_address__c);
            mail.setSubject('Email to inform you about the removal of');
            mail.setToAddresses(emailAddress);        	
            mail.setHtmlBody('Hello!<br/>' + 'The following entries have been removed from the organization:<br/>' + textEmail);
            mails.add(mail);
        }        
        Messaging.sendEmail(mails);
    }
}