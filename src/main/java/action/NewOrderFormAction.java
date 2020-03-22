package action;

import domain.Account;
import domain.Cart;
import domain.Order;

public class NewOrderFormAction extends AbstractAction {

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    private Account account;

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    private Cart cart;

    @Override
    public String execute() throws Exception {
        cart = (Cart)session.get("cart");
        if (cart == null){
            cart = new Cart();
            session.put("cart",cart);
        }

        // 获得账户
        account = (Account) session.get("account");
        if(account == null){
            // 跳转到登录界面
            return "SIGNON";
        }else {
            // 跳转到 订单 页面
            Order order = new Order();
            // 生成订单
            order.initOrder(account,cart);
            session.put("creditCardTypes",order.getCardType());
            session.put("order",order);
            return SUCCESS;
        }
    }


}
