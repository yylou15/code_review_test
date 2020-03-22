package action;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import domain.Account;
import service.AccountService;

public class SignOnAction extends AbstractAction{
    private String username;
    private String password;
    private Account account;
    private AccountService accountService;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public String execute() throws Exception {
        accountService=new AccountService();
        ActionContext actionContext=ActionContext.getContext();
        account=accountService.getAccount(username,password);
        if(account!=null){
            actionContext.getSession().put("account",account);
            return SUCCESS;
        }
        else {
            ValueStack valueStack=actionContext.getValueStack();
            valueStack.set("msg","Sign On Failed.Incorrect username or password.");
            return INPUT;
        }

    }
}
