public with sharing class MyLandingPageController {

    public PageReference goToAssignPage() {
        return new pageReference('/apex/AssignmentPage');
    }


    public PageReference createAssignment() {
        return new pagereference('/apex/CreateTaskpage');
    }


    public PageReference goToAssignment() {
        return new pageReference('/apex/MyTasks');
    }


public pageReference goToPlay(){
  return new pageReference('/apex/page2play');

}
public pageReference goToLearn(){
  return new pageReference('/apex/page2learn');

}
public pageReference goToAbout(){
  return new pageReference('/apex/AboutPage');

}
public pagereference goHome(){
   return new pageReference('/apex/landingpage');
}
}