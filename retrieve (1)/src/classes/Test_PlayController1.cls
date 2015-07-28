@isTest(seeAllData=true)
public class Test_PlayController1 {
public static String wrong;

      
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
      profileid = profiles.get('System Administrator'), 
      timezonesidkey='America/Los_Angeles', 
      username='funlearnuser@testorg.com');

      insert standard;

  Questionaire__c q = new Questionaire__c();
  q.question__c ='On Lead Conversion a Lead Object Custom field cannot be mapped to Which Object custom field?';
  q.type__c = 'ADM 201';
  insert q;
  
  Questionaire__c q1 = new Questionaire__c();
  q1.question__c ='On Lead Conversion a Lead Object Custom field cannot be mapped to Which Object custom field?';
  q1.type__c = 'ADM 201';
  insert q1;
  
  Questionaire__c q2 = new Questionaire__c();
  q2.question__c ='On Lead Conversion a Lead Object Custom field cannot be mapped to Which Object custom field?';
  q2.type__c = 'ADM 201';
  insert q2;
  
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
  
  q1.option1__c = opt.id;
  q1.option2__c = opt1.id;
  q1.option3__c = opt2.id;
  q1.option4__c = opt3.id;
  q1.solution1__c = opt2.id;
  q1.solution2__c =opt1.id;
  update q1;
  
  q2.option1__c = opt.id;
  q2.option2__c = opt1.id;
  q2.option3__c = opt2.id;
  q2.option4__c = opt3.id;
  q2.solution1__c = opt2.id;
  q2.solution2__c =opt1.id;
  update q2;
  Set<String> wrongs = new Set<String>();
  wrongs.add(q.id);
  wrongs.add(q1.id);
  wrongs.add(q2.id);
  system.runas(standard){
  ApexPages.currentPage().getParameters().put('time', 'two');
  ApexPages.currentPage().getParameters().put('type', 'adm');
  playController1 p1 = new playController1();
  p1.check1=true;
  p1.check2=true;
  p1.check3=true;
  p1.check4=true;
 // p1.wrongQues=wrongs;
 // p1.lifelinesUsed = 0;
 
  list<SelectOption> myopt = p1.getOptions();
  System.assertEquals(myopt.size(),4);
  p1.submitAns();
  p1.showWrongs();
  p1.done();
  p1.returnResult();
  
  p1.redeemPoints();
  p1.quit();
  }
  }
  
  }