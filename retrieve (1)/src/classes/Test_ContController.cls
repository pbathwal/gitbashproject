@isTest
public class Test_ContController {
public static TestMethod void test1(){
Map<String,ID> profiles = new Map<String,ID>();
     List<Profile> ps = [select id, name from Profile where name = 
         'Standard User' or name = 'System Administrator'];

      for(Profile p : ps){
         profiles.put(p.name, p.id);
      }
      User standard = new User(alias = 'standt', 
      email='standarduser@testorg.com', 
      emailencodingkey='UTF-8', 
      lastname='Testing', languagelocalekey='en_US', 
      localesidkey='en_US', Points_Gained__c = 20,
      Number_Of_Questions_Completed__c = 2,
      profileid = profiles.get('System Administrator'), 
      timezonesidkey='America/Los_Angeles', 
      username='funlearnuser@testorg.com');

      insert standard;

Questionaire__c q = new Questionaire__c();
  q.question__c ='On Lead Conversion a Lead Object Custom field cannot be mapped to Which Object custom field?';
  q.type__c = 'ADM 201';
  insert q;
  
  Option__c opt = new Option__c();
  opt.option__c = 'Account';
  opt.question__c = q.id;
  insert opt;
  
  Option__c opt1 = new Option__c();
  opt1.option__c = 'Contact';
  opt1.question__c = q.id;
  insert opt1;
  
  Option__c opt2 = new Option__c();
  opt2.option__c = 'Case';
  opt2.question__c = q.id;
  insert opt2;
  
  Option__c opt3 = new Option__c();
  opt3.option__c = 'Opportunity';
  opt3.question__c = q.id;
  insert opt3;
  
  q.option1__c = opt.id;
  q.option2__c = opt1.id;
  q.option3__c = opt2.id;
  q.option4__c = opt3.id;
  q.solution1__c = opt2.id;
  q.solution2__c =opt1.id;
  update q;
  system.runAs(standard){
   ApexPages.currentPage().getParameters().put('type', 'adm');
   
   ContController cc = new ContController();
   Pagereference pageRef = cc.goContinue();
   Pagereference pageRef1 = cc.goDontContinue();
   pageReference p = new pageReference('/apex/learnpageclonedbyraji?continue=2&type=adm');
   pageReference p1 = new pageReference('/apex/learnpageclonedbyraji?continue=0&type=adm');
   
   system.assertEquals('/apex/learnpageclonedbyraji?continue=2&type=adm',pageRef.getURL());
   system.assertEquals('/apex/learnpageclonedbyraji?continue=0&type=adm',pageRef1.getURL());
   }
 }
 
 }