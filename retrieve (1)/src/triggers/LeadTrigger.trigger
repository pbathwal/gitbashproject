trigger LeadTrigger on Lead (after insert,after update,after delete,before insert,before update) {

    if (Trigger.isBefore && Trigger.isInsert){
        /*list<lead> allleads = [select id,email,phone from lead];
        list<lead> deleteLead = new list<lead>();
            for(lead newL: Trigger.new){
                 for(lead allL: allleads){
                  if(newL.email == allL.email && newL.phone== allL.phone)
                     newL.addError('Failed to insert this lead!');// prevent duplicate leads to insert.
                  }
             }  */
    }
    
    if (Trigger.isAfter && Trigger.isInsert){
        LeadtriggerUtility util = new LeadtriggerUtility();
        Util.convertAccount(Trigger.new);
    }

}