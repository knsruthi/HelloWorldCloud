public class LoginForm {
    
    public Contact c{get;set;}
    
    public LoginForm(ApexPages.StandardController stdController){
        this.c = (Contact)stdController.getRecord();
        c.MailingCountry = 'United States';
    }
    
    public PageReference saveInfo(){
        System.debug('From saveInfo');
        c.RegisteredOn__c = system.today();
        c.web_registered__C = true;
        if(c.MailingPostalCode.length() != 5 && c.MailingPostalCode.length() != 9){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Please Enter Valid postal code of length 5 or 9.');
     		ApexPages.addMessage(myMsg);
            return null;
        }
        if(c.password__c.length() < 8){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Password should be minimum 8 characters in size');
     		ApexPages.addMessage(myMsg);
            return null;
        }
        try{
            insert c;
            PageReference pg = new PageReference('/apex/SuccessPage?id='+c.Id);
        	pg.setRedirect(true);
        	return pg;
        }catch(Exception e){
            system.debug('Exception occured while inserting contact login : '+e);
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Please enter a unique username.For more details please contact the administrator');
     		ApexPages.addMessage(myMsg);
            return null;
        }
        return null; 
    }
    
    public pageReference redirectInfo(){
        system.debug('cancel');
        return null;
    }

}