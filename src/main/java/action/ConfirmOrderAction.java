package action;

import domain.Order;

import javax.servlet.http.HttpSession;

public class ConfirmOrderAction extends AbstractAction {

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    private Order order;
    @Override
    public String execute() throws Exception {

        // 修改订单消息
        Order last_order = (Order)session.get("order");
        order.setCardType(last_order.getCardType());
        order.setCreditCard(last_order.getCreditCard());
        order.setExpiryDate(last_order.getExpiryDate());
        order.setBillToFirstName(last_order.getBillToFirstName());
        order.setBillToLastName(last_order.getBillToLastName());
        order.setShipToFirstName(last_order.getShipToFirstName());
        order.setShipToLastName(last_order.getShipToLastName());
        order.setBillAddress1(last_order.getBillAddress1());
        order.setBillAddress2(last_order.getBillAddress2());
        order.setShipAddress1(last_order.getShipAddress1());
        order.setShipAddress2(last_order.getShipAddress2());
        order.setBillCity(last_order.getBillCity());
        order.setShipCity(last_order.getShipCity());
        order.setBillState(last_order.getBillState());
        order.setShipState(last_order.getShipState());
        order.setBillZip(last_order.getBillZip());
        order.setShipZip(last_order.getShipZip());
        order.setBillCountry(last_order.getBillCountry());
        order.setShipCountry(last_order.getShipCountry());
        order.setUsername(last_order.getUsername());
        order.setOrderDate(last_order.getOrderDate());
        order.setCourier(last_order.getCourier());
        order.setLocale(last_order.getLocale());
        order.setStatus(last_order.getStatus());
        order.setTotalPrice(last_order.getTotalPrice());


        session.put("order",order);

        if(session.get("shippingAddressRequired") != null){
            return "SHIPPINGFORM";
        }else{
            return SUCCESS;
        }
    }
    }


