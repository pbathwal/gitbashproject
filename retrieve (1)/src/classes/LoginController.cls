public class LoginController {


public String vEmail{get;set;}
public String vPassword{get;set;}


public void LoginController() {

}


  public PageReference login() {
    
    try{
      system.debug('******vEmail '+vEmail);
      system.debug('******vPassword '+vPassword);
      Account acc = [select id,name,Email__c,password__c from account where Email__c=: vEmail and password__c =: vPassword];
      system.debug('******acc '+acc );
        PageReference pageRef= new PageReference('/apex/Account');
        pageRef.setredirect(false);        
        return pageRef;      

     }catch(Exception e){
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Wrong Username or Password'));
       return null;
      }
    }

}