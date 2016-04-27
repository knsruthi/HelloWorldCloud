public class SuccessPageCon {
    public contact c{get;set;}
    
    public SuccessPageCon(){
        String cId = ApexPages.currentPage().getParameters().get('id');
        c = [select Name, FirstName, LastName from contact where Id =: cId];
    }

}