package action;

import domain.Cart;
import domain.Order;
import service.OrderService;


public class ViewOrderAction extends AbstractAction {
    @Override
    public String execute() throws Exception {

        Order order = (Order) session.get("order");
        session.put("lineItems",order.getLineItems());

        OrderService orderService = new OrderService();
        orderService.insertOrder(order);

        // 重置购物车
        Cart cart = new Cart();
        session.put("cart",cart);
        return SUCCESS;
    }
}
