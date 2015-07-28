public class LeadtriggerUtility {


    public void convertAccount(List<lead> newLeads){
    
        list<lead> convertLead = new list<lead>();
        list<account> allAccounts = [select id,email__c,phone from account];
        
        for(Lead newL: newLeads){
             if(newL.password__c != null){ //create account only if lead comes from register page.
                if(allAccounts.size()>0){  
                    for(Account allA: allAccounts){
                        if(newL.email == allA.email__c && newL.phone== allA.phone) //Account already exist;dont do anything.
                           system.debug('******For lead: '+newL+'\n*******Account Already exist: '+allA);
                        else
                            convertLead.add(newL);
                    }
                } 
                else
                  convertLead.add(newL);
             }
        }
        
        
        system.debug('******convertLead: '+convertLead);
        system.debug('******convertLead Size: '+convertLead.size());
        //call convert method.
        if(convertLead.size()>0)
         CreateAccount(convertLead);
    
    }




    public void CreateAccount(List<lead> newLeads){
        system.debug('******newLeads: '+newLeads);
        List<account> insertAccount = new List<Account>();
        
        for(Lead nL: newLeads){
            
            Account newAcc = new Account();
            newAcc.name = nL.FirstName +' '+nl.LastName;
            newAcc.phone = nL.phone;
            newAcc.password__c = nL.password__c;
            newAcc.email__c = nL.email;
            newAcc.Address__c = nL.Address__c;
            insertAccount.add(newAcc);
        }
        system.debug('******insertAccount: '+insertAccount);
        if(insertAccount.size()>0)
         insert insertAccount;
    }

}