package service;

import dao.*;
import domain.Item;
import domain.LineItem;
import domain.Order;
import domain.Sequence;
import org.apache.ibatis.session.SqlSession;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class OrderService {
  private  SqlSession sqlSession;
  private ItemDAO itemDAO;
  private LineItemDAO lineItemDAO;
  private OrderDAO orderDAO;
  private SequenceDAO sequenceDAO;

  public OrderService(){
    sqlSession = SqlSessionFactoryUtil.getSqlSessionFactory().openSession(true);
    lineItemDAO = sqlSession.getMapper(LineItemDAO.class);
    orderDAO = sqlSession.getMapper(OrderDAO.class);
    itemDAO = sqlSession.getMapper(ItemDAO.class);
    sequenceDAO = sqlSession.getMapper(SequenceDAO.class);
  }
  public void insertOrder(Order order) {
    order.setOrderId(getNextId("ordernum"));
    for (int i = 0; i < order.getLineItems().size(); i++) {
      LineItem lineItem = (LineItem) order.getLineItems().get(i);
      String itemId = lineItem.getItemId();
      Integer increment = new Integer(lineItem.getQuantity());
      Map<String, Object> param = new HashMap<String, Object>(2);
      param.put("itemId", itemId);
      param.put("increment", increment);
      itemDAO.updateInventoryQuantity(param);
    }

    orderDAO.insertOrder(order);
    orderDAO.insertOrderStatus(order);
    for (int i = 0; i < order.getLineItems().size(); i++) {
      LineItem lineItem = (LineItem) order.getLineItems().get(i);
      lineItem.setOrderId(order.getOrderId());
      lineItemDAO.insertLineItem(lineItem);
    }
  }


  public Order getOrder(int orderId) {
    Order order = orderDAO.getOrder(orderId);
    order.setLineItems(lineItemDAO.getLineItemsByOrderId(orderId));

    for (int i = 0; i < order.getLineItems().size(); i++) {
      LineItem lineItem = (LineItem) order.getLineItems().get(i);
      Item item = itemDAO.getItem(lineItem.getItemId());
      item.setQuantity(itemDAO.getInventoryQuantity(lineItem.getItemId()));
      lineItem.setItem(item);
    }

    return order;
  }

  public List<Order> getOrdersByUsername(String username) {
    return orderDAO.getOrdersByUsername(username);
  }

  public int getNextId(String name) {
    Sequence sequence = new Sequence(name, -1);
    sequence = (Sequence) sequenceDAO.getSequence(sequence);
    if (sequence == null) {
      throw new RuntimeException("Error: A null sequence was returned from the database (could not get next " + name
          + " sequence).");
    }
    Sequence parameterObject = new Sequence(name, sequence.getNextId() + 1);
    sequenceDAO.updateSequence(parameterObject);
    return sequence.getNextId();
  }

}
