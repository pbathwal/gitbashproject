@isTest
public class Test_Page2Controller {
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
  
  page2Controller pc = new page2Controller();
 // pc.testCategory = 'two';
  pc.clicked();
  pc.clicked1();
  pc.clicked2();
  pc.clicked3();
  system.assertEquals(pc.flag,true);
  system.assertEquals(pc.flag1,true);
  system.assertEquals(pc.flag2,true);
  system.assertEquals(pc.flag3,true);
  
  pageReference p = pc.adm();
  system.assertEquals('/apex/playpage?time=null&type=adm',p.getURL());
  pc.adm1();
  pc.admLearn();
  pageReference p1 = pc.dev();
  system.assertEquals('/apex/playpage?time=null&type=dev',p1.getURL());
  pc.dev1();
  pc.devLearn();
  pageReference p2 = pc.sales();
  system.assertEquals('/apex/playpage?time=null&type=sales',p2.getURL());
  pc.sales1();
  pc.salesLearn();
  pageReference p3 = pc.service();
  system.assertEquals('/apex/playpage?time=null&type=service',p3.getURL());
  pc.service1();
  pc.serviceLearn();
  
 }
 
 }