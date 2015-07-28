public with sharing class MyTasks {
public List<Task> mytasks {get;set;}
public String myparam {get;set;}
public boolean haveTasks{get;set;}
  public MyTasks(){
    mytasks = new List<Task>();
  //  RecordType rt = [select id from RecordType where developername LIKE:'Assignment'];
    mytasks = [select ownerId,subject,topics__c,Difficulty_Level__c,Status,ActivityDate,priority from Task where ownerId=:userInfo.getUserId() AND assignment__c=true AND status!='Completed'];
    if(mytasks.size()==0)
      haveTasks = false;
    else
      haveTasks = true;
    system.debug('============have tasks======='+havetasks+'=='+mytasks.size());  
  }
  public pageReference startAssignment(){
   system.debug('------------Inside-------------');
    myparam = Apexpages.currentpage().getparameters().get('myparam');
    String type='';
    String timer='';
    system.debug('=======myparam===='+myparam);
    Task t = [select topics__c,Difficulty_Level__c from Task where id=:myparam];
    if(t.topics__c!=null){
      if(t.topics__c == 'ADM 201')
      type='adm';
      if(t.topics__c == 'DEV 401')
      type='dev';
      if(t.topics__c == 'Sales Cloud')
      type='sales';
      if(t.topics__c == 'Service Cloud')
      type='service';
      }
    if(t.Difficulty_Level__c !=null){
         if(t.Difficulty_Level__c == 'Super Ninja 2 mins') 
         timer='two';
         if(t.Difficulty_Level__c == 'Five Minute Fun 5 mins') 
         timer='five';
         if(t.Difficulty_Level__c == 'Zen Mode 10 mins') 
         timer='ten';
      }
      
      // Check if the user has update access on the Task.Status field
    if (!Schema.sObjectType.Task.fields.Status.isUpdateable()){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,
                                                 'Insufficient access to update status'));
      return null;
    }
      
     t.status = 'Completed';
     update t; 
    return new pagereference('/apex/playpage?time='+timer+'&type='+type);
  
  }
  
  public pageReference goHome(){
    return new pageReference('/apex/landingpage');
  }
  
}