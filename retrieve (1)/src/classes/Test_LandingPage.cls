@isTest
public class Test_LandingPage {
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
  String w = q.id+'ATR';
  ApexPages.currentPage().getParameters().put('wrong', w);
  ApexPages.currentPage().getParameters().put('total', '10');
  ApexPages.currentPage().getParameters().put('points', '3');
  ApexPages.currentPage().getParameters().put('quit', 'true');
  ApexPages.currentPage().getParameters().put('correct', '7');
  
  LandingPageController  lp = new LandingPageController ();
  pageReference pageRef = lp.CheckWrongAnswers();
//  String checkWrong = '/apex/LearnPageclonedbyraji1?wrong='+w+'&total=10&correct=7';
  system.assertEquals(lp.wrongIds,w);
  system.assertEquals(lp.total,'10');
  system.assertEquals(lp.correct,'7');
  pageReference pageRef1 = lp.goToLandingPage();
  system.assertequals('/apex/landingpage',pageRef1.getURL());
  pageReference pageRef2 = lp.goToLearnPage();
  system.assertequals('/apex/page2learn',pageRef2.getURL());
  pageReference pageRef3 = lp.goToPlayPage();
  system.assertequals('/apex/page2play',pageRef3.getURL());
  lp.postOnChatter();
  lp.postOnChatter1();
  lp.postOnChatter2();
  }
  }