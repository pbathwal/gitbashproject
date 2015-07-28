public with sharing class playController2 {
public List<Questionaire__c> questions {get;set;}
public Questionaire__c currQuestion1 {get;set;}
public integer counter1 {get;set;}
public boolean completed1 {get;set;}
public boolean check5 {get;set;}
public String wrongIds {get;set;}
public List<String> wrong {get;set;}
public String answer1 {get;set;}
public List<SelectOption> options;
public String total {get;set;}
public String correct {get;set;}
public boolean myflag {get;set;}

public playController2(){
myflag=false;
wrongIds = apexpages.currentpage().getparameters().get('wrong');
if(apexpages.currentpage().getparameters().get('total')!=null || apexpages.currentpage().getparameters().get('total')!='')
      total = apexpages.currentpage().getparameters().get('total');
   if(apexpages.currentpage().getparameters().get('correct')!=null || apexpages.currentpage().getparameters().get('correct')!='')
      correct = apexpages.currentpage().getparameters().get('correct');
system.debug('========param-------'+wrongIds);
wrong = new list<String>();
counter1 = 0;
String[] strArr =WrongIds.split('ATR');
system.debug('===strArr=='+strArr);
for(String s : strArr){
  wrong.add(s);
}
 system.debug('============wrong========'+wrong);
 questions = [SELECT Option1__c,Option1__r.Option__c,Option2__c,Option2__r.Option__c,Option3__r.Option__c,Option3__c,Option4__c,Option4__r.option__c,OwnerId,Question__c,Solution1__c,Solution1__r.option__c,Solution2__c,Solution2__r.option__c,Solution3__c,Solution3__r.option__c,multiselect__c,Multi_Select__c FROM Questionaire__c where id IN:strArr];
counter1 = 0;
currQuestion1 =  questions[0];
completed1 = false;
//questions = new List<Questionaire__c>();
}

public void showWrongQuestions(){
    system.debug('----------in here----------');
     counter1 = 0;
     questions = [SELECT Option1__c,Option1__r.Option__c,Option2__c,Option2__r.Option__c,Option3__r.Option__c,Option3__c,Option4__c,Option4__r.option__c,OwnerId,Question__c,Solution1__c,Solution1__r.option__c,Solution2__c,Solution2__r.option__c,Solution3__c,Solution3__r.option__c,multiselect__c,Multi_Select__c FROM Questionaire__c where id IN:wrong];
     currQuestion1 =  questions[0];
     system.debug('----------in here----------'+currQuestion1);

  }
  
  public void nextQues(){
  if(counter1<questions.size() && questions.size()!=1 ){
    counter1=counter1+1;
    currQuestion1 =  questions[counter1];
    if(currQuestion1.Multi_Select__c == true)
      myflag=true;
    else 
       myflag=false;  
    }
    if(counter1 >= (questions.size()-1)){
      completed1 = true;
      
    }
    }
      
  public list<SelectOption> getOptions()
  {
    list<SelectOption> options = new list<SelectOption>();
    
    options.add(new SelectOption(currquestion1.Option1__c, currquestion1.Option1__r.Option__c));
    options.add(new SelectOption(currquestion1.Option2__c, currquestion1.Option2__r.Option__c));
    if(currquestion1.Option3__c!=null)
    options.add(new SelectOption(currquestion1.Option3__c, currquestion1.Option3__r.Option__c));
    if(currquestion1.Option4__c!=null)
    options.add(new SelectOption(currquestion1.Option4__c, currquestion1.Option4__r.Option__c));

    return options;
  } 
  
   public pagereference done(){
    return new pageReference('/apex/Congratulationspage?wrong='+WrongIds+'&total='+total+'&correct='+correct); 
  
  }
  }