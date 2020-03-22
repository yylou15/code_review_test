package action;

import com.opensymphony.xwork2.ActionContext;
import domain.Account;
import service.AccountService;

public class EditAccountAction extends AbstractAction{
    private String username;
    private Account account;
    private AccountService accountService;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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
        account=accountService.getAccount(username);
        return SUCCESS;
    }
}
