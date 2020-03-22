package action;

import domain.Account;
import service.AccountService;

public class NewAccountAction extends AbstractAction{
    private Account account;
    private AccountService accountService;

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public String execute() throws Exception {
        accountService=new AccountService();
        accountService.insertAccount(account);
        return SUCCESS;
    }
}
