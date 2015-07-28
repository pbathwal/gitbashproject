public with sharing class playController1 {
public List<Questionaire__c> questions {get;set;}
public List<Questionaire__c> askedQuestions {get;set;}
public Questionaire__c currQuestion {get;set;}
public Questionaire__c currQuestion1 {get;set;}
public boolean hasPoints {get;set;}
public String answer {get;set;}
public integer counter {get;set;}
public boolean multiselect {get;set;}
public boolean correct {get;set;}
public Map<String,String> quesAns {get;set;}
public boolean flag {get;set;}
public boolean test {get;set;}
public String answer1 {get;set;}
public boolean completed {get;set;}
public integer timer {get;set;}
public boolean timeout {get;set;}
public Map<String,String> wrongAns {get;set;} 
public boolean check1 {get;set;}
public boolean check2 {get;set;}
public boolean check3 {get;set;}
public boolean check4 {get;set;}
public String checkOpt1 {get;set;}
public String checkOpt2 {get;set;}
public String checkOpt3 {get;set;}
public String checkOpt4 {get;set;}
public Set<String> wrongQues {get;set;}
public List<String> questionsAttempted {get;set;}
public integer numOfQues {get;set;}
public integer numOfCorrectAns {get;set;}
public boolean donePlay {get;set;}
public Map<Id,String> justWrongQuestions {get;set;}
public Set<String> checkedOptions {get;set;}
public Set<String> correctSolutions {get;set;}
public Datetime timestart {get;set;}
public boolean threewrong {get;set;}
public integer numOfwrongAns {get;set;}
public User loggedInUser {get;set;}
public Long startTS {get;set;}
public integer counter1 {get;set;}
public boolean completed1 {get;set;}
public boolean check5 {get;set;}
public String WrongIds {get;set;}
public integer numOfWrong {get;set;}
public integer lifelinesUsed {get;set;}
public String type {get;set;}
public long timeSelected {get;set;}
public long timeSelectedinSecs {get;set;}


public List<SelectOption> options;

  public playController1(){
  timestart= System.now();
   counter = 0;
   counter1 = 0;
   numOfQues = 0;
   numOfCorrectAns = 0;
   numOfWrong = 0;
   lifelinesUsed = 0;
   flag=false;
   test=false;
   donePlay=false;
   completed=false;
   timer = 5000;
   timeout=false;
   threewrong = false;
   numOfwrongAns = 0;
   completed1 = false;
   WrongIds = '';
   hasPoints = true;
   
   quesAns = new Map<String,String>();
   wrongAns = new Map<String,String>();
   wrongques = new Set<String>(); 
   checkedOptions = new Set<String>();
   correctSolutions = new Set<String>();
   justWrongQuestions = new Map<Id,String>();
   questionsAttempted = new List<String>();
   startTS = System.currentTimeMillis();
   String timesel = apexpages.currentpage().getparameters().get('time');
   if(timesel == 'two'){
     timeSelected = 120000;
     timeSelectedinSecs = 120;
     }
   else if(timesel == 'five'){
     timeSelected = 300000;
     timeSelectedinSecs = 300;
     }
   else if(timesel == 'ten') { 
      timeSelected = 600000;
      timeSelectedinSecs = 600;
   }
   
   
   String typeselected = apexpages.currentpage().getparameters().get('type');
   if(typeselected == 'adm')
     type='ADM 201';
   else if(typeselected == 'dev')
     type = 'DEV 401';
   else if(typeselected == 'sales')  
      type = 'Sales Cloud';
   else if( typeselected == 'service')
      type = 'Service Cloud';
   else
     type='';
   loggedInUser = [select id,Points_Gained__c from User where id=:UserInfo.getUserId()];
   questions = [SELECT Option1__c,Option1__r.Option__c,Option2__c,Option2__r.Option__c,Option3__r.Option__c,Option3__c,Option4__c,Option4__r.option__c,OwnerId,Question__c,Solution1__c,Solution1__r.option__c,Solution2__c,Solution2__r.option__c,Solution3__c,Solution3__r.option__c,multiselect__c,Multi_Select__c FROM Questionaire__c where type__c=:type];
   system.debug('=========questions=========='+questions);
   currquestion = questions[0];
   system.debug('===========current question==========='+currQuestion);
   options = new list<SelectOption>();
  }
  
 /* public void showWrongQuestions(){
     counter1 = 0;
     questions = [SELECT Option1__c,Option1__r.Option__c,Option2__c,Option2__r.Option__c,Option3__r.Option__c,Option3__c,Option4__c,Option4__r.option__c,OwnerId,Question__c,Solution1__c,Solution1__r.option__c,Solution2__c,Solution2__r.option__c,Solution3__c,Solution3__r.option__c,multiselect__c,Multi_Select__c FROM Questionaire__c where id IN:wrongQues];
     currQuestion1 =  questions[0];

  }
  
  public void nextQues(){
    counter1+=1;
    currQuestion1 =  questions[counter];
    if(counter == (questions.size()-1)){
      completed1 = true;
      
    }
  }
  */
  public pageReference showWrongs(){
     system.debug('=========inside wrong=======');
     returnResult();
    for(String i : wrongques){

     WrongIds+=i+'ATR';
     
    }
    String[] strArr =WrongIds.split('ATR'); 
    
    system.debug('============wrong ids-----------'+WrongIds);
    system.debug('============wrong id after split-----------'+strArr);
  //  return new pagereference('/apex/LearnPageclonedbyraji1?wrong='+WrongIds);
    return new pageReference('/apex/Congratulationspage?wrong='+WrongIds+'&total='+numOfQues+'&correct='+numOfCorrectAns);
 //  return null;
  }
  
  
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
/* 
 public pageReference nextQuestion(){
  flag=false;
  counter+=1;
  //system.debug('=======time elapsed==='+(timestart.time()-system.now().gettime()));
  if(counter<questions.size() && questions.size()!=1){
   system.debug('=======here1======'+counter);
  currquestion = questions[counter];
  }
  else if(counter==questions.size()-1 )
  {
  system.debug('-------here2========='+counter);
  completed=true;
  }
  else
   { 
   system.debug('===========here3-------'+counter);
   completed=true;
  // counter=0;
 //  currquestion = questions[counter];
   
   } 
    return null;
 }*/
 
 
 public pageReference submitAns(){
 system.debug('------------current question--------'+currquestion);
 
 if(currquestion.Multi_Select__c == false){
    if(answer==null || answer==''){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please answer this question before proceeding.');
            ApexPages.addMessage(myMsg);
            flag = false;
            return null;
    }
    else{
 
     flag = false;
     system.debug('==========answer====='+answer+'===========solution=========='+currQuestion.Solution1__r.option__c);
     if(currQuestion.Multi_Select__c==false){
     Option__c opt = [select option__c from option__c where id=:answer];
   //  quesAns.put(currquestion.question__c,opt.option__c);
      questionsAttempted.add(currQuestion.id);
      if(currQuestion.Solution1__c!=answer) 
      { correct=false;
       // wrongAns.put(currquestion.question__c,currQuestion.Solution1__r.option__c);
        wrongQues.add(currquestion.id);
        numOfWrong+=1;
      }
      else
        correct = true;
     
      } 
      
  
        
     }
      
    }
     else{
        if(check1==false && check2==false && check3==false && check4==false){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please answer this question before proceeding.');
            ApexPages.addMessage(myMsg);
            flag = false;
            return null;
       }
       else{
     
      checkedOptions = new Set<String>();
      correctSolutions = new Set<String>();
      flag = false;
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
      }
     else
     {
       correct=false;
       try{
        wrongQues.add(currquestion.id);
        numOfWrong+=1;
        }catch(Exception e){
        
        }
     } 
    
    }
    
    
   }
   
        ////////////////////////Check for 3 wrong answers////////////////////////////////
      
      if(wrongQues.size()==3 && lifelinesUsed==0){
      system.debug('============wrongQues======='+wrongQues);
       threewrong = true;
       return null;
      }
      else if(wrongQues.size()==6 && lifelinesUsed==1){
      system.debug('============wrongQues======='+wrongQues);
    //   threewrong = true;
       showWrongs();
       return new pageReference('/apex/Congratulationspage?wrong='+WrongIds+'&total='+numOfQues+'&correct='+numOfCorrectAns);
      }
   /*   else if(wrongQues.size()==9 && lifelinesUsed==2){
      system.debug('============wrongQues======='+wrongQues);
       threewrong = true;
       return null;
      }
      else if(wrongQues.size()==12 && lifelinesUsed==3){
      system.debug('============wrongQues======='+wrongQues);
       threewrong = true;
       return null;
      }*/
      //////////////////////Check for timeout//////////////////////////////////////////// 
      else if(System.currentTimeMillis() - startTS>=timeSelected){
       system.debug('------------TimeOut!!!------------'+(System.currentTimeMillis() - startTS));
       timeout=true;
       showWrongs();
       return new pageReference('/apex/Congratulationspage?wrong='+WrongIds+'&total='+numOfQues+'&correct='+numOfCorrectAns);
      }
    //////////////////////////////////////////////////////////////////////////////////////  
      
      else{
      
      system.debug('==========quesAns========='+quesAns+'==========wrong========'+wrongAns);
      counter+=1;
      if(counter<questions.size()-1){
       system.debug('=======here1======'+counter);
      currquestion = questions[counter];
      }
      else 
      {
      system.debug('-------here2========='+counter);
      completed=true;
      }
      
       return null;
       } 
  
 }
 
/* public pagereference getAnswer(){
   test = true;
   return null;
 }*/
 
 public pageReference done(){
  //return new pageReference('/apex/landingpage');
  doneplay=true;
  showWrongs();
  return new pageReference('/apex/Congratulationspage?wrong='+WrongIds+'&total='+numOfQues+'&correct='+numOfCorrectAns);
 }
 
/* public pageReference startOver(){
 flag=false;
 completed=false;
 counter=0;
  currquestion = questions[counter];
 return null;
 }
 public void callMethod(){
    timeout=true;
   
  }*/
  
  public void returnResult(){
  numOfQues = questionsAttempted.size();
  numOfCorrectAns = numOfQues - wrongQues.size();
  system.debug('------------Attempted------------'+numOfQues+'============correct=========='+numOfCorrectAns);
  for(String s : wrongQues){
   Questionaire__c q = [SELECT Option1__c,Option1__r.Option__c,Option2__c,Option2__r.Option__c,Option3__r.Option__c,Option3__c,Option4__c,Option4__r.option__c,OwnerId,Question__c,Solution1__c,Solution1__r.option__c,Solution2__c,Solution2__r.option__c,Solution3__c,Solution3__r.option__c,multiselect__c,Multi_Select__c FROM Questionaire__c where id=:s ];
   if(q.Multi_Select__c!=true){
     wrongAns.put(q.id,q.Solution1__r.option__c);
     numOfwrongAns = wrongAns.size();
     justWrongQuestions.put(q.id,q.question__c);
     }
   else{
    String answers='';
    if(q.solution3__c!=null){
      answers = q.Solution1__r.option__c+'; '+q.Solution2__r.option__c+'; '+q.Solution3__r.option__c;
      wrongAns.put(q.id,answers);
      justWrongQuestions.put(q.id,q.question__c);
      }
   else{
      answers = q.Solution1__r.option__c+'; '+q.Solution2__r.option__c;
      wrongAns.put(q.id,answers);
      numOfwrongAns = wrongAns.size();
      justWrongQuestions.put(q.id,q.question__c);
     }
   }  
  }
  system.debug('----------Wrong questions with answers-----------'+wrongAns);
  //return null;
  }
  
  public void redeemPoints(){
    if(loggedInUser.Points_Gained__c !=null && loggedInUser.Points_Gained__c>=2) {
      threewrong=false;
      lifelinesUsed+=1;
      counter+=1;
      currquestion = questions[counter];
     // wrongQues.clear();
     // numOfWrong=0;
     
      // Check if the user has update access on the loggedInUser.Points_Gained__c field
    if (!Schema.sObjectType.User.fields.Points_Gained__c.isUpdateable()){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,
                                                 'Insufficient access to update user points'));
      return;
    }
     
      loggedInUser.Points_Gained__c-=2;
      update loggedInUser;
      hasPoints=true;
    }
    else{
      hasPoints=false;
    }
  }
  
  public pageReference quit(){
  showWrongs();
   return new pageReference('/apex/Congratulationspage?wrong='+WrongIds+'&total='+numOfQues+'&correct='+numOfCorrectAns);
  }
  
}