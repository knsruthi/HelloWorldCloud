public class AdminReportCon {
    public List<contact> contactList{get;set;}
    
    
    public AdminReportCon(ApexPages.StandardController stdController){
        contactList = [select Id, FirstName, LastName, MailingCity, MailingState, UserName__c, RegisteredOn__c from
                      contact where web_registered__C = true];        
    }
    

}