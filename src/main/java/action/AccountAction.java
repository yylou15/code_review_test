package action;

import domain.Account;
import service.AccountService;


public class AccountAction extends AbstractAction {
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

    public String signonForm() {
        return SUCCESS;
    }

    public String signoff() {
        session.remove("account");
        return SUCCESS;
    }
}
