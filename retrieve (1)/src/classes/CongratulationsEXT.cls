public class CongratulationsEXT {

    public CongratulationsEXT (CongratulationController controller) {

    }
    
    public PageReference redirect()
    {
        PageReference confirm = Page.login;
        return confirm;
        }

}