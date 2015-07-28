@isTest
public class Test_PlayController2 {
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
  update q;
  system.runas(standard){
  wrong = q.id+'ATR';
  ApexPages.currentPage().getParameters().put('correct', '8');
  ApexPages.currentPage().getParameters().put('total', '10');
  ApexPages.currentPage().getParameters().put('wrong', wrong);
  
  playController2 p2 = new playController2();
  p2.showWrongQuestions();
  p2.nextQues();
//  p2.getOptions();
  list<SelectOption> myopt = p2.getOptions();
  System.assertEquals(myopt.size(),4);
  pageReference pageRef = p2.done();
  
  Map<String,String> pageParameters = pageRef.getParameters();
    System.assertEquals(3,pageParameters.values().size());
    System.assertEquals('8',pageParameters.get('correct'));
    System.assertEquals('10',pageParameters.get('total'));
    System.assertEquals(wrong,pageParameters.get('wrong'));
}
}

}