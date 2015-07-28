@isTest(seeAllData=true)
public class Test_MyTasks {
public static TestMethod void test1(){
 //RecordType rt = [select id from RecordType where developername LIKE:'Assignment'];
 Task t = new Task();
 t.status = 'Not Started';
 t.topics__c = 'ADM 201';
 t.Difficulty_Level__c = 'Super Ninja 2 mins';
 t.ownerId = userInfo.getUserId(); 
 t.assignment__c = true;
 //t.recordTypeId = rt.id;
 insert t;
  Apexpages.currentpage().getparameters().put('myparam',t.id);
  MyTasks tt = new MyTasks ();
   pageReference pageRef = tt.startAssignment();
   system.assertEquals('/apex/playpage?time=two&type=adm',pageRef.getURL());
   pageReference pageRef1 = tt.goHome();
   system.assertEquals('/apex/landingpage',pageRef1.getURL());
 
}


}