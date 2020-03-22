package action;

import com.opensymphony.xwork2.Action;

public class ViewHelpAction implements Action {
    @Override
    public String execute() throws Exception {
        return "HELP";
    }
}
