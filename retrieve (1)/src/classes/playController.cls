public with sharing class playController {
public List<Questionaire__c> questions {get;set;}
public List<Questionaire__c> askedQuestions {get;set;}
public Questionaire__c currQuestion {get;set;}
public String answer {get;set;}
public integer counter {get;set;}
public boolean multiselect {get;set;}
public boolean correct {get;set;}
public Map<String,String> quesAns {get;set;}
public boolean flag {get;set;}
public boolean test {get;set;}
public String answer1 {get;set;}
public boolean completed {get;set;}
public boolean check1 {get;set;}
public boolean check2 {get;set;}
public boolean check3 {get;set;}
public boolean check4 {get;set;}
public boolean check5 {get;set;}
public List<String> questionsAttempted {get;set;}
public Set<String> checkedOptions {get;set;}
public Set<String> correctSolutions {get;set;}
public Set<String> continuousCorrectAns {get;set;}
public integer points {get;set;}
public User loggedInUser {get;set;}
public String type {get;set;}
public String cont {get;set;}
public String typeselected {get;set;}


public List<SelectOption> options;

  public playController(){
   
   //counter = 0;
   flag=false;
   test=false;
   completed=false;
   check1=false;
   check2=false;
   check3=false;
   check4=false;
   check5=false;
   points = 0;
   
   if(apexpages.currentpage().getparameters().get('continue')!=null){
    system.debug('---------Continue found!------------');
    cont = apexpages.currentpage().getparameters().get('continue');
    counter=Integer.valueof(cont);
    system.debug('======counter in continue--------'+counter); 
   }
   
   else{
   counter=0;
   system.debug('---------No continue-----------');
   }
   typeselected = apexpages.currentpage().getparameters().get('type');
   if(typeselected == 'adm')
     type='ADM 201';
   else if(typeselected == 'dev')
     type = 'DEV 401';
   else if(typeselected == 'sales')  
      type = 'Sales Cloud';
   else if( typeselected == 'service')
      type = 'Service Cloud';
   continuousCorrectAns= new Set<String>();
   loggedInUser = [select id,Points_Gained__c,Number_Of_Questions_Completed__c from User where id=:UserInfo.getUserId()];
  /* if(loggedInUser.Number_Of_Questions_Completed__c == null || loggedInUser.Number_Of_Questions_Completed__c ==0)
    counter=0;
   else 
    counter = Integer.valueOf(loggedInUser.Number_Of_Questions_Completed__c); 
  */
   quesAns = new Map<String,String>();
   questions = [SELECT Option1__c,Option1__r.Option__c,Option2__c,Option2__r.Option__c,Option3__r.Option__c,Option3__c,Option4__c,Option4__r.option__c,OwnerId,Question__c,Solution1__c,Solution1__r.option__c,Solution2__c,Solution2__r.option__c,Solution3__c,Solution3__r.option__c,Multi_Select__c FROM Questionaire__c where type__c=:type];
   system.debug('=========questions=========='+questions);
   try{
   currquestion = questions[counter];
   }catch(Exception e){
   
   }
   system.debug('===========current question==========='+currQuestion);
   options = new list<SelectOption>();
   questionsAttempted = new List<String>();
   checkedOptions = new Set<String>();
   correctSolutions = new Set<String>();
  }
  
 /* public void checked1(){
    check1=true;
    
  }
  public void checked2(){
    check2=true;
  }
  public void checked3(){
    check3=true;
  }
  public void checked4(){
    check4=true;
  }
  */
 public list<SelectOption> getOptions()
  {
    list<SelectOption> options = new list<SelectOption>();
    
    options.add(new SelectOption(currquestion.Option1__c, currquestion.Option1__r.Option__c));
    options.add(new SelectOption(currquestion.Option2__c, currquestion.Option2__r.Option__c));
    if(currquestion.Option3__c!=null)
    options.add(new SelectOption(currquestion.Option3__c, currquestion.Option3__r.Option__c));
    if(currquestion.Option4__c!=null)
    options.add(new SelectOption(currquestion.Option4__c, currquestion.Option4__r.Option__c));

    return options;
  }
 
 public pageReference nextQuestion(){
  flag=false;
  
  counter+=1;
  if(counter<questions.size()-1){
   system.debug('=======here1======'+counter);
  currquestion = questions[counter];
  }
  else if(counter==questions.size()-1 )
  {
  system.debug('-------here2========='+counter);
  //completed=true;
  }
  else
   { 
   system.debug('===========here3-------'+counter);
   
   } 
   
  if(check1==true) check1=false;
  if(check2==true) check2=false;
  if(check3==true) check3=false;
  if(check4==true) check4=false;
    return null;
 }
 public void submitAns(){
   
   
   if(currquestion.Multi_Select__c == false){
    if(answer==null || answer==''){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please answer this question before proceeding.');
            ApexPages.addMessage(myMsg);
            flag = false;
    }
    else{
     flag=true;
     questionsAttempted.add(currQuestion.id);
      system.debug('==========answer====='+answer+'===========solution=========='+currQuestion.Solution1__r.option__c);
      Option__c opt = [select option__c from option__c where id=:answer];
      quesAns.put(currquestion.question__c,opt.option__c);
      if(currQuestion.Solution1__c!=answer) 
       correct=false;
      else{
        correct = true; 
        continuousCorrectAns.add(currQuestion.id);
     //   flag=false;
    //    counter+=1;
        }
      system.debug('==========correct answer1========='+continuousCorrectAns.size());}
     } 
  else{
    if(check1==false && check2==false && check3==false && check4==false){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please answer this question before proceeding.');
            ApexPages.addMessage(myMsg);
            flag = false;
    }
    else{
      flag = true;
      questionsAttempted.add(currQuestion.id);
      if(check1==true) 
       checkedOptions.add(currQuestion.option1__c);
       if(check2==true) 
       checkedOptions.add(currQuestion.option2__c);
       if(check3==true) 
       checkedOptions.add(currQuestion.option3__c);
       if(check4==true) 
       checkedOptions.add(currQuestion.option4__c);
       
      correctSolutions.add(currQuestion.solution1__c);
      correctSolutions.add(currQuestion.solution2__c);
      if(currQuestion.solution3__c!=null)
      correctSolutions.add(currQuestion.solution3__c);
      
      system.debug('==========Checked==='+checkedOptions+'=====solutions===='+correctSolutions);
      if(correctSolutions.size()==checkedoptions.size() && correctSolutions.containsAll(checkedOptions)){
        correct=true;
      //  flag=false;
     //   counter+=1;
        continuousCorrectAns.add(currQuestion.id);
        system.debug('===========correct========'+continuousCorrectAns.size());
      }
     else
      {
       correct=false;
       system.debug('===========false========'+correct);
       }
       }
  }    
     
   system.debug('========counter======='+counter);
   if(counter<questions.size()){
      completed=false;
      system.debug('---less----');
      }
   else{
      system.debug('=========More or equal====');
      completed=true;
   }    
  //return null;
 }
 
 public pagereference getAnswer(){
   test = true;
   return null;
 }
 
 public pagereference quit(){
  loggedInUser.Number_Of_Questions_Completed__c = counter+1;
  
  // Check if the user has update access on the loggedInUser.Points_Gained__c field
    if (!Schema.sObjectType.User.fields.Number_Of_Questions_Completed__c.isUpdateable()){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,
                                                 'Insufficient access to update task'));
      return null;
    }
  
  update loggedInUser;
  points = calculatepoints();
  return new pageReference('/apex/keepituppage?points='+points+'&quit=true');
 }
 
 public pageReference done(){
  points = calculatepoints();
  
  
 // loggedInUser.Number_Of_Questions_Completed__c = counter+1;
 
  // Check if the user has update access on the loggedInUser.Points_Gained__c field
    if (!Schema.sObjectType.User.fields.Points_Gained__c.isUpdateable()){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,
                                                 'Insufficient access to update task'));
      return null;
    }
  if(loggedInUser.Points_Gained__c == null)
  loggedInUser.Points_Gained__c = points;
  else
  loggedInUser.Points_Gained__c += points;  
  update loggedInUser;
  counter=0;
  return new pageReference('/apex/Welldonepage');
 }
 
 public pageReference startOver(){
 flag=false;
 completed=false;
 points = calculatepoints();
 
 // Check if the user has update access on the loggedInUser.Points_Gained__c field
    if (!Schema.sObjectType.User.fields.Points_Gained__c.isUpdateable()){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,
                                                 'Insufficient access to update task'));
      return null;
    }
 loggedInUser.Points_Gained__c += points;
 update loggedInUser;
 
 counter=0;
  currquestion = questions[counter];
 return null;
 }
 
 public integer calculatepoints(){
   integer pointsGained = continuousCorrectAns.size()/5;
   return pointsGained;
 }
}