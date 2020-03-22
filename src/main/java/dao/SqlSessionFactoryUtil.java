package dao;

import domain.Account;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class SqlSessionFactoryUtil {

    private static SqlSessionFactory sf = null;

    private static String resource = "mybatis-config.xml";

    public static SqlSessionFactory getSqlSessionFactory(){
        if(sf==null)
        {
            try {
                InputStream inputStream = Resources.getResourceAsStream(resource);
                sf = new SqlSessionFactoryBuilder().build(inputStream);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return  sf;
    }

//    public static void main(String[] args) {
//        getSqlSessionFactory();
//        Account login= new Account();
//        login.setFirstname("admin");
//        login.setLastname("admin");
//
//        SqlSession session = getSqlSessionFactory().openSession();
//
//        AccountDAO accountDao = session.getMapper(AccountDAO.class);
//
//        Account result =accountDao.selectAccountByUsernameAndPassword(login);
//
//        System.out.println(result.getFirstname());
//    }
}
