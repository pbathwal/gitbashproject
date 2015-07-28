public with sharing class ContController {
public User u {get;set;}
public String type {get;set;}
public contController(){
  u = [SELECT Number_Of_Questions_Completed__c,Points_Gained__c FROM User where id=:userinfo.getUserId()][0];
  type=apexpages.currentpage().getparameters().get('type');
}
public pageReference goContinue(){
  return new pagereference('/apex/learnpageclonedbyraji?continue='+u.Number_Of_Questions_Completed__c+'&type='+type);
}
public pageReference goDontContinue(){
  return new pagereference('/apex/learnpageclonedbyraji?continue=0'+'&type='+type);
}
}