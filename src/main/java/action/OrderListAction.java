package action;

import domain.Account;
import domain.Order;
import service.OrderService;

import java.util.List;

public class OrderListAction extends AbstractAction {

    private Account account;
    @Override
    public String execute() throws Exception {
        account = (Account)session.get("account");

        OrderService orderService = new OrderService();
        List<Order> orderList = orderService.getOrdersByUsername(account.getUsername());

        session.put("orderList",orderList);
        return SUCCESS;
    }


}
