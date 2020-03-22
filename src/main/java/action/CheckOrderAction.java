package action;

import domain.Order;
import service.OrderService;

public class CheckOrderAction extends AbstractAction {

    private Integer orderId;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    private Order order;
    @Override
    public String execute() throws Exception {

        orderId = Integer.valueOf((Integer) session.get("orderId"));

        OrderService orderService = new OrderService();
        order = orderService.getOrder(orderId);

        session.put("order",order);
        return SUCCESS;
    }

}
