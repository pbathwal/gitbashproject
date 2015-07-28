public with sharing class LandingPageController {
public String wrongIds {get;set;}
public String total {get;set;}
public String correct {get;set;}
public boolean flag {get;set;}
public boolean check {get;set;}
public boolean check1 {get;set;}
public boolean check2 {get;set;}
public String points {get;set;}
public integer totalpoints {get;set;}
public String quit {get;set;}

  public landingPageController(){
   if(apexpages.currentpage().getparameters().get('wrong')!=null || apexpages.currentpage().getparameters().get('wrong')!='')
     wrongIds = apexpages.currentpage().getparameters().get('wrong');
   if(apexpages.currentpage().getparameters().get('total')!=null || apexpages.currentpage().getparameters().get('total')!='')
      total = apexpages.currentpage().getparameters().get('total');
   if(apexpages.currentpage().getparameters().get('points')!=null || apexpages.currentpage().getparameters().get('points')!='')
      points = apexpages.currentpage().getparameters().get('points');
   if(apexpages.currentpage().getparameters().get('quit')!=null || apexpages.currentpage().getparameters().get('quit')!='')
      quit = apexpages.currentpage().getparameters().get('quit');
   if(apexpages.currentpage().getparameters().get('correct')!=null || apexpages.currentpage().getparameters().get('correct')!='')
      correct = apexpages.currentpage().getparameters().get('correct');
      check = false;
      check1 = false;
      check2 = false;
      if(total==correct){
        flag=false;
      }
     else{
        flag=true;
     } 
   totalpoints = (Integer)[select Points_Gained__c from user where id=:UserInfo.getUserId()][0].Points_Gained__c;
  }
  public pageReference CheckWrongAnswers(){
   return new pageReference('/apex/LearnPageclonedbyraji1?wrong='+WrongIds+'&total='+total+'&correct='+correct);
  }
  public pageReference goToLandingPage(){
    return new pageReference('/apex/landingpage');
  }
  public pageReference goToPlayPage(){
    return new pageReference('/apex/page2play');
  }
  public pageReference goToLearnPage(){
  if(quit=='')
    return new pageReference('/apex/page2learn');
  else
     return new pageReference('/apex/page2learn'); 
  }
  public void postOnChatter(){
    check = true;
    
    User u = [select firstname from User where id =: UserInfo.getUserId()];
    Feeditem fi = new Feeditem();
    fi.parentId = UserInfo.getUserId();
    fi.body = 'Yes! I just played FunLearn & scored '+correct+' out of '+total+' questions.Feeling accomplished!!!';
     // Check if the user has update access on the Task.assignment__c field
    if (!Schema.sObjectType.Feeditem.isCreateable()){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,
                                                 'Insufficient access to create chatter post'));
      return;
    }
    insert fi;
  }
  public void postOnChatter1(){
    check1 = true;
    
    User u = [select firstname from User where id =: UserInfo.getUserId()];
    Feeditem fi = new Feeditem();
    fi.parentId = UserInfo.getUserId();
    fi.body = 'Yes! I just played FunLearn & gained '+points+' points. My total points have gone up to '+totalpoints+'. Feeling accomplished!!!';
     if (!Schema.sObjectType.Feeditem.isCreateable()){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,
                                                 'Insufficient access to create chatter post'));
      return;
    }
    insert fi;
  }
  
  public void postOnChatter2(){
    check2 = true;
    
    User u = [select firstname from User where id =: UserInfo.getUserId()];
    Feeditem fi = new Feeditem();
    fi.parentId = UserInfo.getUserId();
    fi.body = 'Yes! I just played FunLearn & learned up all the questions. Feeling accomplished!!!';
     if (!Schema.sObjectType.Feeditem.isCreateable()){
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,
                                                 'Insufficient access to create chatter post'));
      return;
    }
    insert fi;
  }
}