public with sharing class CreateTask{

 public Task t;
 public boolean taskcreated {get;set;}

 public Task getT(){
   if(t==null)
     t=new Task();
   return t;  
 }
 
 public CreateTask(){
  taskcreated=false;
 }
 
 public CreateTask(ApexPages.StandardController controller) {
  
   taskcreated=false;
    }
 public void CreateAssignment(){
   //recordtype rt = [select id from recordtype where developername LIKE: 'Assignment'];
  // t.recordTypeId=rt.id;
   // Check if the user has update access on the Task.assignment__c field
    if (!Schema.sObjectType.Task.isCreateable()){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,
                                                 'Insufficient access to create Task'));
      return;
    }
   t.assignment__c=true;
   insert t;
   taskcreated=true;
 } 
 
 
 public pageReference goHome(){
   return new pageReference('/apex/landingpage');
 }

}