package service;

import dao.*;
import domain.Account;
import org.apache.ibatis.session.SqlSession;

public class AccountService {

  private SqlSession sqlSession;
  private AccountDAO accountDAO;

  public AccountService(){
    sqlSession = SqlSessionFactoryUtil.getSqlSessionFactory().openSession(true);
    accountDAO = sqlSession.getMapper(AccountDAO.class);
  }
  public Account getAccount(String username) {
    return accountDAO.getAccountByUsername(username);
  }

  public Account getAccount(String username, String password) {
    Account account = new Account();
    account.setUsername(username);
    account.setPassword(password);
    return accountDAO.getAccountByUsernameAndPassword(account);
  }

  public void insertAccount(Account account) {
    accountDAO.insertAccount(account);
    accountDAO.insertProfile(account);
    accountDAO.insertSignon(account);
  }

  public void updateAccount(Account account) {
    accountDAO.updateAccount(account);
    accountDAO.updateProfile(account);

    if (account.getPassword() != null && account.getPassword().length() > 0) {
      accountDAO.updateSignon(account);
    }
  }

    public boolean usernameIsExist(String username) {
        return accountDAO.getAccountByUsername(username)!=null;}
    }

