@isTest
public class Test_MyLandingPageController {
public static TestMethod void test1(){

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
  
  MyLandingPageController lp = new MyLandingPageController();
  pageReference pageRef = lp.goToPlay();
  system.assertEquals('/apex/page2play',pageRef.getURL());
  pageReference pageRef1 = lp.goToLearn();
  system.assertEquals('/apex/page2learn',pageRef1.getURL());
  pageReference pageRef2 = lp.goToAbout();
  system.assertEquals('/apex/AboutPage',pageRef2.getURL());
  pageReference pageRef3 = lp.goHome();
  system.assertEquals('/apex/landingpage',pageRef3.getURL());
  pageReference pageRef4 = lp.goToAssignPage();
  system.assertEquals('/apex/AssignmentPage',pageRef4.getURL());
  pageReference pageRef5 = lp.createAssignment();
  system.assertEquals('/apex/CreateTaskpage',pageRef5.getURL());
  pageReference pageRef6 = lp.goToAssignment();
  system.assertEquals('/apex/MyTasks',pageRef6.getURL());
 }
 
 }