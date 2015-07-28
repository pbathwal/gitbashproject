public class RegisterEXT {

    public RegisterEXT(ApexPages.StandardController controller) {

    }
    
    public PageReference redirect()
    {
        PageReference confirm = Page.Congratulations;
        return confirm;
        }

}