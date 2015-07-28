@isTest(seeAllData=true)
public class Test_CreateTask {
public static TestMethod void test1(){
//RecordType rt = [select id from RecordType where developername LIKE:'Assignment'];
 Task t = new Task();
 t.status = 'Not Started';
 t.topics__c = 'ADM 201';
 t.Difficulty_Level__c = 'Super Ninja 2 mins';
 t.ownerId = userInfo.getUserId(); 
// t.recordTypeId = rt.id;
 insert t;
 ApexPages.StandardController controller = new ApexPages.StandardController(t);
 CreateTask tt = new CreateTask(controller);
 tt.getT();
 system.assertEquals(false, tt.taskcreated);
 tt.CreateAssignment();
 system.assertEquals(true, tt.taskcreated);
 pageReference pageRef = tt.goHome();
 system.assertEquals('/apex/landingpage',pageRef.getURL());

}

}