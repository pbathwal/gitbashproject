public with sharing class page2Controller{
public boolean flag {get;set;}
public boolean flag1 {get;set;}
public boolean flag2 {get;set;}
public boolean flag3 {get;set;}
public String testCategory {get;set;}
public String type {get;set;}
public boolean noinput {get;set;}

public page2controller(){
  flag = false;
  flag1 = false;
  flag2 = false;
  flag3 = false;
  noinput = false;
}
public void clicked(){
  if(flag==true)
    flag=false;
  else
    flag=true;
  
}
public void clicked1(){
  if(flag1==true)
    flag1=false;
  else
    flag1=true;
}
public void clicked2(){
  if(flag2==true)
    flag2=false;
  else
    flag2=true;
}
public void clicked3(){
  if(flag3==true)
    flag3=false;
  else
    flag3=true;
}
public pagereference adm(){
   return new pageReference('/apex/playpage?time='+testCategory+'&type=adm');
} 
public pagereference adm1(){
  if(testCategory == null || testCategory == ''){
     noinput=true;
     ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please select any one option before proceeding.');
     ApexPages.addMessage(myMsg);
     return null;}
  else
    //adm();
    return new pageReference('/apex/playpage?time='+testCategory+'&type=adm');
}

public pagereference admLearn(){
   User u = [select Number_Of_Questions_Completed__c from User where id =:UserInfo.getUserId()];
   if(u.Number_Of_Questions_Completed__c!=null || u.Number_Of_Questions_Completed__c!=0){
   return new pageReference('/apex/continuepage?type=adm');
   }
   else
   return new pageReference('/apex/learnpageclonedbyraji?type=adm');
} 
public pagereference dev(){
   return new pageReference('/apex/playpage?time='+testCategory+'&type=dev');
} 
public pagereference dev1(){
  if(testCategory == null || testCategory == ''){
     noinput=true;
     ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please select any one option before proceeding.');
     ApexPages.addMessage(myMsg);
     return null;}
  else
    //dev();
    return new pageReference('/apex/playpage?time='+testCategory+'&type=dev');
}

public pagereference devLearn(){
   return new pageReference('/apex/learnpageclonedbyraji?type=dev');
} 
public pagereference sales(){
   return new pageReference('/apex/playpage?time='+testCategory+'&type=sales');
} 
public pagereference sales1(){
    if(testCategory == null || testCategory == ''){
     noinput=true;
     ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please select any one option before proceeding.');
     ApexPages.addMessage(myMsg);
     return null;}
  else
   // sales();
   return new pageReference('/apex/playpage?time='+testCategory+'&type=sales');
} 
public pagereference salesLearn(){
   return new pageReference('/apex/learnpageclonedbyraji?type=sales');
} 
public pagereference service(){
   return new pageReference('/apex/playpage?time='+testCategory+'&type=service');
} 

public pagereference service1(){
    if(testCategory == null || testCategory == ''){
     noinput=true;
     ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please select any one option before proceeding.');
     ApexPages.addMessage(myMsg);
     return null;}
  else
    //service();
    return new pageReference('/apex/playpage?time='+testCategory+'&type=service');
} 
public pagereference serviceLearn(){
   return new pageReference('/apex/learnpageclonedbyraji?type=service');
} 
}